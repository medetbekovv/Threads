//
//  ForgotPasswordViewModel.swift
//  Threads
//
//  Created by Sultan on 18/9/23.
//

import UIKit

protocol ForgotPasswordProtocol {
    
    var isForgotIn: Bool { get }
    var forgotResult: ((Result<Data, Error>) -> Void)? { get set }
    
    func forgot(email : String)
}

class ForgotPasswordViewModel : ForgotPasswordProtocol {
    
    var isForgotIn: Bool = false
    
    var forgotResult: ((Result<Data, Error>) -> Void)?
    
    let apiService: ApiService
    
    init() {
        self.apiService = ApiService()
    }
    
    func forgot(email: String) {
        let parameters : [String : Any] = ["email": email]
        
        apiService.post(endpoint: "api/user/forgot_password/", parameters: parameters) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    self.isForgotIn = true
                    self.forgotResult?(.success(data))
                case .failure(let error):
                    let errorMessage = "Error - \(error.localizedDescription)"
                    print(errorMessage)
                    self.isForgotIn = false
                    self.forgotResult?(.failure(error))
                    print(error)
                }
            }
        }
    }
    
    
}
