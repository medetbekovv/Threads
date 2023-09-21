//
//  OTPViewModel.swift
//  Threads
//
//  Created by Sultan on 18/9/23.
//

import UIKit

protocol OTPProtocol {
    var isOTPIn: Bool { get }
    var otpResult: ((Result<Data, Error>) -> Void)? { get set }
    
    func otp(code : String)
    
}

class OTPViewModel : OTPProtocol {
    
    var isOTPIn: Bool = false
    
    var otpResult: ((Result<Data, Error>) -> Void)?
    
    let apiService: ApiService
    
    init() {
        self.apiService = ApiService()
    }
    
    func otp(code: String) {
        let parameters: [String : Any] = ["code": code]
        
        guard let token = AuthManager.shared.accesToken else { return }
        
        apiService.postToken(enpoid: "api/user/otp_verificaton/", parameters: parameters, bearerToken: token) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    self?.isOTPIn = true
                    self?.otpResult?(.success(data))
                case .failure(let error):
                    let errorMessage = "Failed register number: \(error.localizedDescription)"
                    print(errorMessage)
                    self?.isOTPIn = false
                    self?.otpResult?(.failure(error))
                    print(error)
                }
            }
        }
    }
    
    
}

