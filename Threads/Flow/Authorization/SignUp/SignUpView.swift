//
//  SignUpView.swift
//  Threads
//
//  Created by Sultan on 7/8/23.
//

import RswiftResources
import UIKit
import SnapKit

class SignUpView: BaseView {
    
    private lazy var title : UILabel = {
        let label = UILabel()
        label.font = R.font.sfProDisplayBold(size: 34)
        label.text = "Create an account"
        return label
    }()
    
     lazy var subTitle : UILabel = {
        let label = UILabel()
        label.text = "Create account to start using Threads"
        label.font = R.font.sfProDisplayMedium(size: 17)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)
        return label
        
    }()
    
     lazy var textFieldEmail : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Your email"
        tf.autocorrectionType = .no
        tf.layer.cornerRadius = 8
        tf.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        tf.layer.borderColor = UIColor(red: 191/255, green: 194/255, blue: 196/255, alpha: 1).cgColor
        tf.layer.borderWidth = 1
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftView = paddingView
        tf.leftViewMode = .always

        return tf

    }()
    
     lazy var textFieldName : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Your name"
        tf.autocorrectionType = .no
        tf.layer.cornerRadius = 8
        tf.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        tf.layer.borderColor = UIColor(red: 191/255, green: 194/255, blue: 196/255, alpha: 1).cgColor
        tf.layer.borderWidth = 1
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftView = paddingView
        tf.leftViewMode = .always

        return tf
    }()
    
     lazy var textFieldPassword : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.autocorrectionType = .no
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
    
     lazy var textFieldConfirmPassword : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Confirm password"
        tf.layer.cornerRadius = 8
        tf.autocorrectionType = .no
        tf.isSecureTextEntry = true
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
        button.addTarget(self, action: #selector(toggleConfirmPasswordVisibility), for: .touchUpInside)

        tf.rightView = button
        tf.rightViewMode = .always
        
        return tf
    }()
    
     lazy var createAccountButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Create account", for: .normal)
        button.backgroundColor = UIColor.black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    @objc func togglePasswordVisibility(_ sender: UIButton) {
         sender.isSelected = !sender.isSelected
        textFieldPassword.isSecureTextEntry = !textFieldPassword.isSecureTextEntry
        
     }
    
    @objc func toggleConfirmPasswordVisibility(_ sender: UIButton) {
         sender.isSelected = !sender.isSelected
        textFieldConfirmPassword.isSecureTextEntry = !textFieldConfirmPassword.isSecureTextEntry
        
     }
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
        
    override func setupViews() {
        addSubview(title)
        addSubview(subTitle)
        addSubview(textFieldEmail)
        addSubview(textFieldName)
        addSubview(textFieldPassword)
        addSubview(textFieldConfirmPassword)
        addSubview(createAccountButton)
    }
    override func setupConstraints() {
        
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 180))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 41))
            make.width.equalTo(flexibleWidth(to: 361))
        }
        
        subTitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(flexibleHeight(to: 8))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 22))
            make.width.equalTo(flexibleWidth(to: 361))
        }
        
        textFieldEmail.snp.makeConstraints { make in
            make.top.equalTo(subTitle.snp.bottom).offset(flexibleHeight(to: 32))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
            make.height.equalTo(flexibleHeight(to: 48))
            make.width.equalTo(flexibleWidth(to: 361))
        }
        
        textFieldName.snp.makeConstraints { make in
            make.top.equalTo(textFieldEmail.snp.bottom).offset(flexibleHeight(to: 16))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
            make.height.equalTo(flexibleHeight(to: 48))
            make.width.equalTo(flexibleWidth(to: 361))
        }
        
        textFieldPassword.snp.makeConstraints { make in
            make.top.equalTo(textFieldName.snp.bottom).offset(flexibleHeight(to: 16))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
            make.height.equalTo(flexibleHeight(to: 48))
            make.width.equalTo(flexibleWidth(to: 361))
        }
        
        textFieldConfirmPassword.snp.makeConstraints { make in
            make.top.equalTo(textFieldPassword.snp.bottom).offset(flexibleHeight(to: 16))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
            make.height.equalTo(flexibleHeight(to: 48))
            make.width.equalTo(flexibleWidth(to: 361))
        }
        
        createAccountButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldConfirmPassword.snp.bottom).offset(flexibleHeight(to: 64))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
            make.height.equalTo(flexibleHeight(to: 48))
            make.width.equalTo(flexibleWidth(to: 361))
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
