//
//  EditProfileViewModel.swift
//  Threads
//
//  Created by Sultan on 20/9/23.
//

import UIKit

protocol EditeProfileProtocol {
    var isEditeData: Bool { get }
    var setDataResult: ((Result<Data, Error>) -> Void)? { get set }
    func setData(username: String, name: String, bio: String )
}

class EditProfileViewModel : EditeProfileProtocol {
    
    var apiService = ApiService()
    
    init() {
        self.apiService = ApiService()
    }
    var isEditeData: Bool = false
    var setDataResult: ((Result<Data, Error>) -> Void)?
    
    func setData(username: String, name: String, bio: String) {
        let parameters : [String : Any] = ["name": name, "username" : username, "bio" : bio]
        
        guard let token = AuthManager.shared.accessToken else { return }
        print(token)
        
        apiService.putWithToken(endpoint: "api/user/me/", parameters: parameters, token: token) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    let deceoder = JSONDecoder()
                    self?.isEditeData = true
                    self?.setDataResult?(.success(data))
                    print(data)
                case .failure(let error):
                    let errorMessage = "Failed register number: \(error.localizedDescription)"
                    print(errorMessage)
                    self?.isEditeData = false
                    self?.setDataResult?(.failure(error))
                    print(error)                }
            }
        }
        
//        apiService.getWithToken(endpoint: "api/user/me/", token: token) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let data):
//                    let dataString = String(data: data, encoding: .utf8)
//                    print("Data received : \(dataString ?? "nil")")
//                    self?.isEditeData = true
//                    self?.setDataResult?(.success(data))
//                    print(data)
//                case .failure(let error):
//                    let errorMessage = "Failed setData number: \(error)"
//                    print(errorMessage)
//                    self?.setDataResult?(.failure(error))
//                    print(error)                }
//            }
//        }
    }
}
