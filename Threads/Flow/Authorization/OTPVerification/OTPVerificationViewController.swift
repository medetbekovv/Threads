//
//  OTPVerificationViewController.swift
//  Threads
//
//  Created by Sultan on 10/8/23.
//

import UIKit
import SnapKit
import AEOTPTextField

class OTPVerificationViewController : BaseViewController {
    
    let contentView = OTPVerificationView()
    
    var otpProtocol : OTPProtocol
    
    init(otpProtocol: OTPProtocol) {
        self.otpProtocol = otpProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super .viewDidLoad()
        view.backgroundColor = .white
        
        contentView.otpView.delegate = self
        
        addTargets()
        setupViews()
        setupConstraints()
    }
    
    override func addTargets() {
        contentView.verifyButton.addTarget(self, action: #selector(verifyButtonTapped), for: .touchUpInside)
    }
    
    @objc func verifyButtonTapped() {
        print(contentView.otpView.text ?? "")
        
        guard let codeText = contentView.otpView.text else { return }
        
        if let code = Int(codeText) {
            otpProtocol.otp(code: String(code))
        } else {
            print("wrong code type")
        }
        
        otpProtocol.otpResult = { [weak self] result in
            switch result {
            case.success:
                DispatchQueue.main.async {
                    let vc = TabBarController()
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true)
                }
            case .failure(let error):
                print("Login failed with error: \(error)")
                
                self?.showErrorAlert(message: "Введены неверные данные. Попробуйте еще раз.")
                
            }
            
        }
    }
    
    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Неверные данные", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func setupViews() {
        view.addSubview(contentView)
    }
    
    override func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension OTPVerificationViewController : AEOTPTextFieldDelegate, UITextFieldDelegate {
    func didUserFinishEnter(the code: String) {
        print(code)
    }
}

 
