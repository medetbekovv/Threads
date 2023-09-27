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
    var username : String?
    var name : String?
    var bio : String?
    var photo: UIImage?
    
    init(profileProtocol: ProfileProtocol) {
        self.profileProtocol = profileProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getProfileData()
        
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
    }
    
    func getProfileData() {
        DispatchQueue.main.async {
            self.profileProtocol.fetchUserData { [weak self] (result) in
                switch result {
                case .success(let userData):
                    self?.parseUserData(userData)
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
        
        if let photo = userData["photo"] as? String,
           let photoURL = URL(string: photo) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: photoURL),
                   let image = UIImage(data: imageData){
                    self.contentView.userImage.image = image
                    self.photo = image
                }
            }
        }
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
        let vc = EditProfileViewController(editProfileProtocol: EditProfileViewModel(),
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
