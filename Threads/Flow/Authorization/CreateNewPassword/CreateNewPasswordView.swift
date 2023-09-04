//
//  CreateNewPasswordView.swift
//  Threads
//
//  Created by Sultan on 7/8/23.
//

import UIKit
import SnapKit

class CreateNewPasswordView : BaseView {
    
    private lazy var title : UILabel = {
        let label = UILabel()
        label.font = R.font.sfProDisplayBold(size: 34)
        label.text = "Create new password"
        return label
    }()
    
    private lazy var subTitle : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Your new password must be different from previous used passwords"
        label.font = R.font.sfProDisplayMedium(size: 17)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)
        return label
    }()
    
    private lazy var textFieldPassword : UITextField = {
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
    
    private lazy var textFieldConfirmPassword : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Confirm password"
        tf.layer.cornerRadius = 8
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
    
    private lazy var continueButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Continue", for: .normal)
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
        addSubview(textFieldPassword)
        addSubview(textFieldConfirmPassword)
        addSubview(continueButton)
    }
    override func setupConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 180))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
            make.height.equalTo(flexibleHeight(to: 41))
            make.width.equalTo(flexibleWidth(to: 361))
        }
        
        subTitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(flexibleHeight(to: 8))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 40))
            make.width.equalTo(flexibleWidth(to: 300))
        }
        
        textFieldPassword.snp.makeConstraints { make in
            make.top.equalTo(subTitle.snp.bottom).offset(flexibleHeight(to: 32))
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
        
        continueButton.snp.makeConstraints { make in
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
