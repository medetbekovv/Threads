//
//  ProfileViewModel.swift
//  Threads
//
//  Created by Sultan on 23/9/23.
//

import UIKit


protocol ProfileProtocol {
    func fetchUserData(completion: @escaping (Result<[String: Any], Error>) -> Void)
}


class ProfileViewModel : ProfileProtocol {
    
    var apiService = ApiService()
    
    init() {
        self.apiService = ApiService()
    }
    
    func fetchUserData(completion: @escaping (Result<[String : Any], Error>) -> Void) {
        
        guard let token = AuthManager.shared.accessToken else { return }
        print(" => \(token) <=")
        
        apiService.getWithToken(endpoint: "api/user/me/", token: token) { result in
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
    
    
}
