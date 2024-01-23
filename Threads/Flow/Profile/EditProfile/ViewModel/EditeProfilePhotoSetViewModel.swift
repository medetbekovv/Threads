//
//  EditeProfilePhotoSetViewModel.swift
//  Threads
//
//  Created by Sultan on 29/9/23.
//

import UIKit

protocol SetProfilePhotoProtocol {
    var isSetData: Bool { get }
    var setDataResult: ((Result<Data, Error>) -> Void)? { get set }
    
    func setPhoto(photoData: String)
}


class EditProfileSetPhotoViewModel: SetProfilePhotoProtocol {
    func setPhoto(photoData: String) {
        print("")
    }
    
    
    let apiService: ApiService
    
    init() {
        self.apiService = ApiService()
    }
    
    var isSetData: Bool = false
    
    var setDataResult: ((Result<Data, Error>) -> Void)?
    
//    func setPhoto(photoData: String) {
//        guard let token = AuthManager.shared.accessToken else {
//            return
//        }
//
//        let parameters: [String: Any] = ["photo": photoData]
//
//        apiService.putPhoto(endpoint: "user/me/update-profile-photo/", token: token, parameters: parameters) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let data):
//                    print("Profile photo set successfully")
//                    self?.isSetData = true
//                    self?.setDataResult?(.success(data))
//
//                case .failure(let error):
//                    let errorMessage = "Failed to set profile photo: \(error.localizedDescription)"
//                    print(errorMessage)
//                    self?.isSetData = false
//                    self?.setDataResult?(.failure(error))
//                }
//            }
//        }
        
//        apiService.patchPhoto(endpoint: "user/profile/me/edit_photo/", token: token, parameters: parameters) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let data):
//                    print("Profile photo set successfully")
//                    self?.isSetData = true
//                    self?.setDataResult?(.success(data))
//                case .failure(let error):
//                    let errorMessage = "Failed to set profile photo: \(error.localizedDescription)"
//                    print(errorMessage)
//                    self?.isSetData = false
//                    self?.setDataResult?(.failure(error))
//                }
//            }
//        }
        
}

