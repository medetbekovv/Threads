//
//  ProfileViewController.swift
//  Threads
//
//  Created by Sultan on 14/8/23.
//

import UIKit
import SnapKit

class ProfileViewController : UIViewController {
    
    let contentView = ProfileView()
    
    var profileProtocol: ProfileProtocol
    var profileUImageProtocol: ProfileUImageProtocol
    var username : String?
    var name : String?
    var bio : String?
    var photo: UIImage?
    
    init(profileProtocol: ProfileProtocol,profileUImageProtocol: ProfileUImageProtocol) {
        self.profileProtocol = profileProtocol
        self.profileUImageProtocol = profileUImageProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getProfileData()
        getProfileUImageData()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        var image = UIImage(named: "navigateBur")?.withTintColor(.black)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "asd", image: image, target: self, action: #selector(navigationButton))
        navigationController?.navigationBar.tintColor = .label
        
        addTargets()
        setupViews()
        setupConstraints()
        getProfileData()
        getProfileUImageData()
    }
    
    func getProfileUImageData() {
        DispatchQueue.main.async {
            self.profileUImageProtocol.fetchUserUImage { [weak self] (result) in
                switch result {
                case .success(let uimageData):
                    self?.parseUserUImageData(uimageData)
                    print(" UImage done ")
                case .failure(let error):
                    print("Failed UImage to fetch user data: ", error)

                }
            }
        }
    }
    
    func parseUserUImageData(_ userUImageData: PhotoProfile){

        print("1")
        print(userUImageData)

        if let photoURLString = userUImageData.photo, let url = URL(string: photoURLString) {
            print("Photo from backend: \(photoURLString)")

            URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        print("2")
                        self.contentView.userImage.image = image
                        self.photo = image
                    }
                } else if let error = error {
                    print("Failed to load image: \(error)")
                }
            }
            .resume()

        } else {
            print("Photo is nil or not a valid URL")

        }
        
        
//        print("1")
//        print(userUImageData)
//        if let photo = userUImageData.photo{
//            print("Photo from backend: \(photo)")
//
//            if let imageData = Data(base64Encoded: photo){
//                let image = UIImage(data: imageData)
//                DispatchQueue.main.async {
//                    print("2")
//                    self.contentView.userImage.image = image
//                    self.photo = image
//                    print(image)
//                }
//            }
//        } else {
//            print("Photo is nil")
//        }
    }
    
    func getProfileData() {
        DispatchQueue.main.async {
            self.profileProtocol.fetchUserData { [weak self] (result) in
                switch result {
                case .success(let userData):
                    self?.parseUserData(userData)
                    print(userData)
                case .failure(let error):
                    print("Failed to fetch user data: ", error)
                }
            }
        }
    }
    
    func parseUserData(_ userData: [String: Any]){
        if let username = userData["username"] as? String {
            DispatchQueue.main.async {
                self.contentView.nickNameLabel.text = username
            }
        }
        
        print(userData)
        
        if let name = userData["name"] as? String {
            DispatchQueue.main.async {
                self.contentView.professionalLabel.text = name
            }
        }
        
//        if let photo = userData["photo"] as? String,
//           let photoURL = URL(string: photo) {
//            DispatchQueue.global().async {
//                if let imageData = try? Data(contentsOf: photoURL),
//                   let image = UIImage(data: imageData){
//                    self.contentView.userImage.image = image
//                    self.photo = image
//                }
//            }
//        }
//        if let photo = userData["photo"] as? String,
//           let imageData = Data(base64Encoded: photo) {
//            let image = UIImage(data: imageData)
//            DispatchQueue.main.async {
//                self.contentView.userImage.image = image
//                self.photo = image
//            }
//        }
        self.username = userData["username"] as? String
        self.name = userData["name"] as? String
        self.bio = userData["bio"] as? String

    }
    
    
    
    
   
    
    @objc func navigationButton() {
        let vc = LoginViewController(loginProtocol: LoginViewModel())
          navigationController?.pushViewController(vc, animated: true)
      }
 
     func addTargets() {
         contentView.editButton.addTarget(self, action: #selector(editeButtonNavigation), for: .touchUpInside)
     }
    
    
    @objc private func editeButtonNavigation() {
        let vc = EditProfileViewController(editProfileProtocol: EditProfileViewModel(), editProfilePhotoProtocol: EditProfileSetPhotoViewModel(),
                                           username: username ,
                                           name: name,
                                           bio: bio,
                                           photo: photo
                                           
        )
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
     func setupViews() {
        view.addSubview(contentView)
    }
    
     func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
