//
//  LoginViewModel.swift
//  Threads
//
//  Created by Sultan on 6/9/23.
//

import UIKit


protocol LoginProtocol {
    
    var isLoggedIn: Bool { get }
    var loginResult: ((Result<Data, Error>) -> Void)? { get set }
    
    func login(username: String, password: String)}

class LoginViewModel : LoginProtocol {
    
    let apiService : ApiService
    
    var isLoggedIn: Bool = false
    
    var loginResult: ((Result<Data, Error>) -> Void)?
    
    init() {
        self.apiService = ApiService()
    }
    
    func login(username: String, password: String) {
            let parameters : [String : Any] = ["username" : username, "password" : password]
            apiService.post(endpoint: "api/user/login/", parameters: parameters) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case.success(let data):
                        let decoder = JSONDecoder()
                        if let tokenResponse = try? decoder.decode(TokenResponse.self, from: data){
                            AuthManager.shared.accessToken = tokenResponse.access
                            AuthManager.shared.refreshToken = tokenResponse.refresh
                            
                            self?.isLoggedIn = true
                            self?.loginResult?(.success(data))
                        }
                    case.failure(let error):
                        let errorMessage = "Failed register number: \(error.localizedDescription)"
                        print(errorMessage)
                        self?.loginResult?(.failure(error))
                        print(error)
                    }
                }
            }
        }
}
   
        


    

