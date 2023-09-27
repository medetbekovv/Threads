//
//  LoginView.swift
//  Threads
//
//  Created by Sultan on 2/8/23.
//

import RswiftResources
import UIKit
import SnapKit

class LoginView : BaseView {
    
    private lazy var title : UILabel = {
        let label = UILabel()
        label.font = R.font.sfProDisplayBold(size: 34)
        label.text = "Let’s sign you in"
        return label
    }()
    
    private lazy var subTitle : UILabel = {
        let label = UILabel()
        label.text = "We’ve missed you"
   //     label.font = UIFont(name: "SFProDisplay-Medium", size: 17)
        label.font = R.font.sfProDisplayMedium(size: 17)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)
        return label
    }()
    
     lazy var emailTextFieldEmail : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Your name"
        tf.layer.cornerRadius = 8
        tf.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        tf.layer.borderColor = UIColor(red: 191/255, green: 194/255, blue: 196/255, alpha: 1).cgColor
        tf.layer.borderWidth = 1
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftView = paddingView
        tf.leftViewMode = .always

        return tf
    }()
    
     lazy var passwordTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.layer.cornerRadius = 8
        tf.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        tf.layer.borderColor = UIColor(red: 191/255, green: 194/255, blue: 196/255, alpha: 1).cgColor
        tf.layer.borderWidth = 1
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        
        let button = UIButton(type: .custom)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.setImage(UIImage(named: "eye-off"), for: .normal)
        button.setImage(UIImage(named: "eye"), for: .selected)
        button.frame = CGRect(x: CGFloat(tf.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

        tf.rightView = button
        tf.rightViewMode = .always
        
        return tf
    }()
    
     lazy var forgotButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Forgot password ?", for: .normal)
        button.titleLabel?.font = R.font.sfProDisplayBold(size: 15)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
     lazy var logInButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = UIColor.black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var rectangle : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 191/255, green: 194/255, blue: 196/255, alpha: 1)
        return view
    }()
    
    private lazy var or : UILabel = {
        let label = UILabel()
        label.text = "or"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var rectangle2 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 191/255, green: 194/255, blue: 196/255, alpha: 1)
        return view
    }()
    
     lazy var logWtGoogle : UIButton = {
        let button = UIButton()
        button.setTitle("Login with Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 15)
        button.layer.cornerRadius = 8
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 191/255, green: 194/255, blue: 196/255, alpha: 1).cgColor
        return button
    }()
    
     lazy var logWtApple : UIButton = {
        let button = UIButton()
        button.setTitle("Login with Apple", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 15)
        button.layer.cornerRadius = 8
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 191/255, green: 194/255, blue: 196/255, alpha: 1).cgColor
        return button
    }()
    
    private lazy var dontHaveAccount : UILabel = {
        let label = UILabel()
        label.text = "Don’t have account yet ? "
        label.font = UIFont(name: "SFProDisplay-Medium", size: 15)
        return label
    }()
    
     lazy var signUpButton : UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 15)
        return button
    }()
    
    private lazy var googleImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "googleIcon")
        return image
    }()
    
    private lazy var appleImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "appleIcon")
        return image
    }()
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
        
    override func setupViews() {
        addSubview(title)
        addSubview(subTitle)
        addSubview(emailTextFieldEmail)
        addSubview(passwordTextField)
        addSubview(forgotButton)
        addSubview(logInButton)
        addSubview(rectangle)
        addSubview(or)
        addSubview(rectangle2)
        addSubview(logWtGoogle)
        addSubview(logWtApple)
        addSubview(dontHaveAccount)
        addSubview(signUpButton)
        addSubview(googleImage)
        addSubview(appleImage)
    }
    
    @objc func togglePasswordVisibility(_ sender: UIButton) {
         sender.isSelected = !sender.isSelected
         passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
     }
    
    override func setupConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 180))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 41))
            make.width.equalTo(flexibleWidth(to: 270))
        }
        
        subTitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(flexibleHeight(to: 8))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 20))
            make.width.equalTo(flexibleWidth(to: 142))
        }
        
        emailTextFieldEmail.snp.makeConstraints { make in
            make.top.equalTo(subTitle.snp.bottom).offset(flexibleHeight(to: 32))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleWidth(to: 48))
            make.width.equalTo(flexibleWidth(to: 361))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextFieldEmail.snp.bottom).offset(flexibleHeight(to: 12))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
            make.height.equalTo(flexibleWidth(to: 48))
            make.width.equalTo(flexibleWidth(to: 361))
        }
        
        forgotButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(flexibleHeight(to: 22))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 22))
       
        }
        
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(forgotButton.snp.bottom).offset(flexibleHeight(to: 26))
            make.height.equalTo(flexibleHeight(to: flexibleHeight(to: 48)))
            make.width.equalTo(flexibleWidth(to: flexibleWidth(to: 361)))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
        }
        
        rectangle.snp.makeConstraints { make in
            make.top.equalTo(logInButton.snp.bottom).offset(flexibleHeight(to: 33))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 21))
            make.height.equalTo(flexibleWidth(to: 1))
            make.width.equalTo(flexibleWidth(to: 153))
        }
        
        or.snp.makeConstraints { make in
            make.top.equalTo(logInButton.snp.bottom).offset(flexibleHeight(to: 24))
            make.width.equalTo(flexibleWidth(to: 14))
            make.height.equalTo(flexibleHeight(to: 18))
            make.leading.equalTo(rectangle.snp.trailing).offset(flexibleWidth(to: 15))
            make.trailing.equalTo(rectangle2.snp.leading).offset(flexibleWidth(to: -15))

        }
        
        rectangle2.snp.makeConstraints { make in
            make.top.equalTo(logInButton.snp.bottom).offset(flexibleHeight(to: 33))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -21))
            make.height.equalTo(flexibleWidth(to: 1))
            make.width.equalTo(flexibleWidth(to: 154))
        }
        
        logWtGoogle.snp.makeConstraints { make in
            make.top.equalTo(or.snp.bottom).offset(flexibleHeight(to: 24))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
            make.height.equalTo(flexibleHeight(to: 48))
        }
        
        logWtApple.snp.makeConstraints { make in
            make.top.equalTo(logWtGoogle.snp.bottom).offset(flexibleHeight(to: 16))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
            make.height.equalTo(flexibleHeight(to: 48))
        }
        
        dontHaveAccount.snp.makeConstraints { make in
            make.top.equalTo(logWtApple.snp.bottom).offset(flexibleHeight(to: 77))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(logWtApple.snp.bottom).offset(flexibleHeight(to: 71))
            make.leading.equalTo(dontHaveAccount.snp.trailing).offset(flexibleWidth(to: 1))
        }
        
        googleImage.snp.makeConstraints { make in
            make.top.equalTo(logWtGoogle.snp.top).inset(flexibleHeight(to: 12))
            make.leading.equalTo(logWtGoogle.snp.leading).inset(flexibleWidth(to: 40))
            make.height.equalTo(flexibleHeight(to: 24))
            make.width.equalTo(flexibleWidth(to: 24))
        }
        
        appleImage.snp.makeConstraints { make in
            make.top.equalTo(logWtApple.snp.top).inset(flexibleHeight(to: 12))
            make.leading.equalTo(logWtApple.snp.leading).inset(flexibleWidth(to: 40))
            make.height.equalTo(flexibleHeight(to: 24))
            make.width.equalTo(flexibleWidth(to: 24))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
