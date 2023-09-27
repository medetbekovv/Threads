//
//  SignUpViewController.swift
//  Threads
//
//  Created by Sultan on 7/8/23.
//

import UIKit
import SnapKit

class SignUpViewController: BaseViewController {
    
    let contentView = SignUpView()
    
    var signUpProtocol : SignUpProtocol!
    
    init(signUpProtocol: SignUpProtocol) {
        self.signUpProtocol = signUpProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        view.backgroundColor = .white
        addTargets()
        setupViews()
        setupConstraints()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "asd", image: UIImage(named: "BackIcon"), target: self, action: #selector(backPressed))
        navigationController?.navigationBar.tintColor = .label
    }
    
    override func addTargets() {
        contentView.createAccountButton.addTarget(self, action: #selector(createAccoundTapped), for: .touchUpInside)
    }
    
    @objc func createAccoundTapped() {
        
        guard let email = contentView.textFieldEmail.text,
              !email.isEmpty,
              let username = contentView.textFieldName.text,
              !username.isEmpty,
              let password = contentView.textFieldPassword.text,
              !password.isEmpty,
              let password2 = contentView.textFieldConfirmPassword.text,
                !email.isEmpty else {
            print("Email or password is empty")
            return
        }
    
        signUpProtocol.register(email: email, username: username, password: password, password2: password2)
        
        if email.isEmpty {
            showErrorAlert(message: "Требуется почта")
        }
        
        if !email.contains("@") {
            showErrorAlert(message: "Неверный формат почты")
        }
        
        if username.isEmpty {
            self.showErrorAlert(message: "Требуется никнейм")
        }
        
        if password != password2 {
            self.showErrorAlert(message: "Пароли не совпадают")
        }
        
        
        
//        if signUpProtocol.isRegistered == true {
//            let vc = LoginViewController(loginProtocol: LoginViewModel())
//            navigationController?.pushViewController(vc, animated: true)
//        }
        
        if !email.isEmpty && email.contains("@") && !username.isEmpty && password == password2 {
            signUpProtocol.registerResult = { [weak self] result in
                switch result {
            case .success:
                    DispatchQueue.main.async {
                        let vc = LoginViewController(loginProtocol: LoginViewModel())
                        self?.navigationController?.pushViewController(vc, animated: true)
                    }
            case .failure(let error):
                    print("Register failed with error: \(error)")
                        self?.showErrorAlert(message: "Этот никнейм уже занят.")
                }
            }
        }

        

    }
    
    func showErrorAlert(message : String) {
        let alertController = UIAlertController(title: "Неверные данные", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okButton)
        self.present(alertController, animated: true)
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
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
