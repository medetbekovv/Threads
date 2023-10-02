//
//  EditeProfileViewController.swift
//  Threads
//
//  Created by Sultan on 16/8/23.
//

import SnapKit
import UIKit

class EditProfileViewController: BaseViewController {
    
    private let contentView = EditProfileView()
    
    var editProfileProtocol: EditeProfileProtocol
    var editProfilePhotoProtocol: SetProfilePhotoProtocol
    var username: String?
    var name: String?
    var bio: String?
    var photo: UIImage?
    var isEditButtonPressed = false
    var imageData: Data?
    
    init(editProfileProtocol: EditeProfileProtocol,editProfilePhotoProtocol: SetProfilePhotoProtocol, username: String?, name: String?, bio: String?, photo: UIImage?) {
        self.editProfileProtocol = editProfileProtocol
        self.editProfilePhotoProtocol = editProfilePhotoProtocol
        self.username = username
        self.name = name
        self.bio = bio
        self.photo = photo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addTargets()
        setupView()
        setupTapGesture()
    }
    func setupView() {
        view.addSubview(contentView)
        
        contentView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    func parseUserData() {
        contentView.usernameTextField.text = username
        contentView.nameTextField.text = name
        contentView.bioTextField.text = bio
        contentView.profilePicture.image = photo
    }
    
    override func addTargets() {
        contentView.editPhotoButton.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
        contentView.bottomSheet.setProfilePicture.addTarget(self, action: #selector(setProfilePicturePressed), for: .touchUpInside)
        contentView.exiteButton.addTarget(self, action: #selector(exiteButtonPressed), for: .touchUpInside)
        contentView.doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
    }
    
    @objc func editButtonPressed() {
        if isEditButtonPressed == false{
            presentBottomSheet()
            isEditButtonPressed = true
        }
    }
    
    @objc func exiteButtonPressed() {
        dismiss(animated: true,completion: nil)
    }
    
    @objc func setProfilePicturePressed() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)

        dismissBottomSheet()
        isEditButtonPressed = false
        

    }
    
    @objc func doneButtonPressed() {
        
        let usernamePut = contentView.usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let namePut = contentView.nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let bioPut = contentView.bioTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
      
        if usernamePut.isEmpty || namePut.isEmpty || bioPut.isEmpty {
            let imageBase64String = imageData?.base64EncodedString()
            editProfilePhotoProtocol.setPhoto(photoData: imageBase64String!)
            editProfilePhotoProtocol.setDataResult = {[weak self] result in
                switch result {
                case .success(let data):
                    print(data)
                    DispatchQueue.main.async {
                        self?.dismiss(animated: true)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            editProfileProtocol.setData(username: usernamePut, name: namePut, bio: bioPut)
            editProfileProtocol.setDataResult = {[weak self] result in
                switch result {
                case .success(let data):
                    print(data)
                    DispatchQueue.main.async {
                        self?.dismiss(animated: true)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }

        
//        guard let usernamePut = contentView.usernameTextField.text else { return }
//        guard let namePut = contentView.nameTextField.text else { return }
//        guard let bioPut = contentView.bioTextField.text else { return }
//
        
//        guard let usernamePut = contentView.usernameTextField.text, !usernamePut.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
//        guard let namePut = contentView.nameTextField.text, !namePut.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
//        guard let bioPut = contentView.bioTextField.text, !bioPut.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
//
//        if usernamePut == "" || namePut == "" || bioPut == "" {
//            //            let imageBase64String = imageData?.base64EncodedString()
//            editProfilePhotoProtocol.setPhoto(photoData: imageData!)
//
//            editProfilePhotoProtocol.setDataResult = {[weak self] result in
//                switch result {
//                case.success(let data):
//                    print(data)
//                    DispatchQueue.main.async {
//                        self?.dismiss(animated: true)
//                    }
//                case.failure(let error):
//                    print(error)
//
//                }
//            }
//        } else {
//            //            let imageBase64String = imageData?.base64EncodedString()
//            editProfileProtocol.setData(username: usernamePut, name: namePut, bio: bioPut)
//
//            editProfileProtocol.setDataResult = {[weak self] result in
//                switch result {
//                case.success(let data):
//                    print(data)
//                    DispatchQueue.main.async {
//                        self?.dismiss(animated: true)
//                    }
//                case.failure(let error):
//                    print(error)
//
//                }
//            }
//        }

//        guard let usernamePut = contentView.usernameTextField.text else { return }
//        guard let namePut = contentView.nameTextField.text else { return }
//        guard let bioPut = contentView.bioTextField.text else { return }
//
//        let imageBase64String = imageData?.base64EncodedString()
////        let imageBase64String =  editProfilePhotoProtocol.photoData?.base64EncodedString()
//
//
////        editProfileProtocol.setData(username: usernamePut, name: namePut, bio: bioPut, photo: imageBase64String)
//        editProfileProtocol.setData(username: usernamePut, name: namePut, bio: bioPut)
//
//        editProfileProtocol.setDataResult = { [weak self] result in
//            switch result {
//            case .success(let data):
//                print(data)
//                DispatchQueue.main.async {
//                    self?.dismiss(animated: true)
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
        
    }
        

    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOutside(_:)))
        tapGesture.cancelsTouchesInView = false
        contentView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTapOutside(_ sender: UITapGestureRecognizer) {
        if isEditButtonPressed == true {
            let location = sender.location(in: contentView.bottomSheet)
            
            if !contentView.bottomSheet.bounds.contains(location) {
                if sender.state == .ended {
                    dismissBottomSheet()
                    isEditButtonPressed = false
                }
            }
        }
    }
    
    func presentBottomSheet() {
        
        contentView.layoutIfNeeded()
        
        contentView.overlayView.isHidden = false
        
        UIView.animate(withDuration: 0.3) {
            self.contentView.bottomSheet.frame.origin.y -= self.contentView.bottomSheet.frame.height
        }
    }
    
    func dismissBottomSheet() {
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.bottomSheet.frame.origin.y += self.contentView.bottomSheet.frame.height
        }) { _ in
            self.contentView.bottomSheet.removeFromSuperview()
        }
        
        contentView.overlayView.isHidden = true
    }

}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            contentView.profilePicture.image = selectedImage
            imageData = selectedImage.jpegData(compressionQuality: 0.8)
        }
//            guard let imageData = selectedImage.jpegData(compressionQuality: 0.8) else { return }
            
//           editProfilePhotoProtocol.setPhoto(photoData: imageData)
//            doneButtonPressed(imageData: imageData)
            
//        } else {
//            doneButtonPressed()
//        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
