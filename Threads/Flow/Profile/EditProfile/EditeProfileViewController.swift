//
//  EditeProfileViewController.swift
//  Threads
//
//  Created by Sultan on 16/8/23.
//

import SnapKit
import UIKit

class EditProfileViewController: UIViewController {
    
    private let contentView = EditProfileView()
    
    var isEditButtonPressed = false
    
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
    
    func addTargets() {
        contentView.editPhotoButton.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
        contentView.bottomSheet.setProfilePicture.addTarget(self, action: #selector(setProfilePicturePressed), for: .touchUpInside)
        contentView.exiteButton.addTarget(self, action: #selector(exiteButtonPressed), for: .touchUpInside)
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
        dismissBottomSheet()
        isEditButtonPressed = false
        
        present(imagePicker, animated: true, completion: nil)

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
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
