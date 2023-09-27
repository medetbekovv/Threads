//
//  SignUpViewModel.swift
//  Threads
//
//  Created by Sultan on 12/9/23.
//

 // api/user/register/
import UIKit

protocol SignUpProtocol {
    var isRegistered : Bool { get }
    var registerResult: ((Result<Data, Error>) -> Void)? { get set }
    
    func register(email: String, username: String, password: String, password2: String)
}

class SignUpViewModel : SignUpProtocol{
    
    var apiService = ApiService()
    
    init() {
        self.apiService = ApiService()
    }
    
    var isRegistered: Bool = false
    
    var registerResult: ((Result<Data, Error>) -> Void)?
    

    
    func register(email: String, username: String, password: String, password2: String) {
        let parameters : [String : Any] = ["email": email, "username": username, "password": password, "confirm_password": password2]
        
        if !isValidEmail(email) {
            let error = NSError(domain: " Invalid email format", code: 400, userInfo: nil)
            print("Error:  \(error)")
            registerResult?(.failure(error))
            print(error)
        }
        
        if !isValidPassword(password) {
            let error = NSError(domain: " Invalid password format", code: 400, userInfo: nil)
            registerResult?(.failure(error))
            print(error)
        }
        
        apiService.post(endpoint: "api/user/register/", parameters: parameters) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case.success(let data):
                    let dataString = String(data: data, encoding: .utf8)
                    print("Data received: \(dataString ?? "nil")")
                    self?.isRegistered = true
                    self?.registerResult?(.success(data))
                    print(data)
                case.failure(let error):
                    print(error)
                    let errorMessage = "Failed register number: \(error.localizedDescription)"
                    print(errorMessage)
                    self?.registerResult?(.failure(error))
                    print(error)
                }
            }
        }
        
    }
  
    
    private func isValidEmail(_ email: String) -> Bool {
        return email.lowercased().contains("@gmail.com")
    }
    
    private func isValidPassword(_ password: String) -> Bool {

        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: password)
    }
    
}

