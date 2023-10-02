//
//  ProfileUImageViewModel.swift
//  Threads
//
//  Created by Sultan on 2/10/23.
//

import UIKit

protocol ProfileUImageProtocol {
    func fetchUserUImage(completion: @escaping (Result<[String: Any], Error>) -> Void)

}

class ProfileUImageViewModel: ProfileUImageProtocol {

    var apiService = ApiService()
    
    init() {
        self.apiService = ApiService()
    }
    
    func fetchUserUImage(completion: @escaping (Result<[String : Any], Error>) -> Void) {
        guard let token = AuthManager.shared.accessToken else { return }
            print(" => \(token) <=")
        apiService.getWithToken(endpoint: "api/user/me/update-profile-photo/", token: token) { result in
            switch result {
            case .success(let data):
                do {
                    if let userData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        completion(.success(userData))
                    } else {
                        let error = NSError(domain: "UserDataParsingError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to parse user data"])
                        completion(.failure(error))
                    }
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
  
  
    
    
//    func fetchUserUImage(completion: @escaping (Result<[String : Any], Error>) -> Void) {
//
//        guard let token = AuthManager.shared.accessToken else { return }
//        print(" => \(token) <=")
//
//        apiService.getWithToken(endpoint: "api/user/me/update-profile-photo/", token: token) { <#Result<Data, Error>#> in
//            <#code#>
//        }
//    }
}
