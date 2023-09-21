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
    
    func login(email: String, password: String)}

class LoginViewModel : LoginProtocol {
    
    let apiService : ApiService
    
    var isLoggedIn: Bool = false
    
    var loginResult: ((Result<Data, Error>) -> Void)?
    
    init() {
        self.apiService = ApiService()
    }
    
    func login(email: String, password: String) {
        let parameters: [String: Any] = ["username": email, "password": password]
        
        guard let token = AuthManager.shared.accesToken else { return }
        print("token = \(token) = token")
//        medetbekovs05@gmail.com
//        qwewrty123
        
        apiService.postToken(enpoid: "api/user/login/", parameters: parameters, bearerToken: AuthManager.shared.accesToken ?? "" ) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    let decoder = JSONDecoder()
//                    let dataString = String(data: data, encoding: .utf8)
                    if let tokenResponse = try? decoder.decode(TokenResponse.self, from: data){
                        AuthManager.shared.accesToken = tokenResponse.access
                        AuthManager.shared.refreshToken = tokenResponse.refresh
                        
                        self?.isLoggedIn = true
                        self?.loginResult?(.success(data))
                    }
                        
                case .failure(let error):
                    let errorMessage = "Failed to register number: \(error.localizedDescription)"
                    print(errorMessage)
                    self?.isLoggedIn = false
                    self?.loginResult?(.failure(error))
                }
            }
        }
        
//        apiService.post(endpoint: "api/user/login/", parameters: parameters) { [weak self] (result)in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let data):
//                    let decoder = JSONDecoder()
//                    let dataString = String(data: data, encoding: .utf8)
//                    print("Data received: \(dataString ?? "")")
//                    self?.isLoggedIn = true
//                    self?.loginResult?(.success(data))
//                case .failure(let error):
//                    let errorMessage = "Failed register number: \(error.localizedDescription)"
//                    print(errorMessage)
//                    self?.isLoggedIn = false
//                    self?.loginResult?(.failure(error))
//                }
//
//            }
//        }
    }
    
    
}
