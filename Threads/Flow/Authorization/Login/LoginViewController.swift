//
//  LoginViewController.swift
//  Threads
//
//  Created by Sultan on 2/8/23.
//

import UIKit
import SnapKit

class LoginViewController : BaseViewController {
    
    var loginProtocol : LoginProtocol
    
    init(loginProtocol: LoginProtocol) {
        self.loginProtocol = loginProtocol
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let contentView = LoginView()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        view.backgroundColor = .white
        addTargets()
        setupViews()
        setupConstraints()
    }
    
    override func addTargets() {
        contentView.forgotButton.addTarget(self, action: #selector(forgotButtonTapped), for: .touchUpInside)
        contentView.signUpButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        contentView.logInButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func forgotButtonTapped() {
        let vc = ForgotPasswordViewController(forgotProtocol: ForgotPasswordViewModel())
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func signupButtonTapped() {
        let vc = SignUpViewController(signUpProtocol: SignUpViewModel())
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    @objc func loginButtonTapped() {
        
        guard let email = contentView.emailTextFieldEmail.text , let password = contentView.passwordTextField.text else {
            print("Email or password is empty")
            return
        }
        loginProtocol.login(email: email, password: password)
        loginProtocol.loginResult = { [weak self] result in
            switch result {
            case.success:
                DispatchQueue.main.async {
                    let vc = TabBarController()
                    vc.modalPresentationStyle = .fullScreen

                    self?.present(vc, animated: true)
                }
            case.failure(let error):
                print("login failed with error: \(error)")
                
       
            }
        }
   
    }
    
    func showErrorAlert(message : String) {
        let alertController = UIAlertController(title: "Неверные данные", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
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
