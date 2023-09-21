//
//  ForgotPasswordView.swift
//  Threads
//
//  Created by Sultan on 7/8/23.
//

import RswiftResources
import UIKit
import SnapKit

class ForgotPasswordView : BaseView {
    
    private lazy var title : UILabel = {
        let label = UILabel()
        label.font = R.font.sfProDisplayBold(size: 34)
        label.text = "Forgot password ?"
        return label
    }()
    
    private lazy var subTitle : UILabel = {
        let label = UILabel()
        label.text = "Enter your email address to reset password"
        label.font = R.font.sfProDisplayMedium(size: 17)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)
        return label
        
    }()
    
     lazy var textFieldEmail : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Your email"
        tf.layer.cornerRadius = 8
        tf.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        tf.layer.borderColor = UIColor(red: 191/255, green: 194/255, blue: 196/255, alpha: 1).cgColor
        tf.layer.borderWidth = 1
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftView = paddingView
        tf.leftViewMode = .always

        return tf
    }()
    
     lazy var continueButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = UIColor.black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
        
    override func setupViews() {
        addSubview(title)
        addSubview(subTitle)
        addSubview(textFieldEmail)
        addSubview(continueButton)
    }
    override func setupConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 180))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 41))
            make.width.equalTo(flexibleWidth(to: 310))
        }
        
        subTitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(flexibleHeight(to: 8))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 20))
            make.width.equalTo(flexibleWidth(to: 361))
        }
        
        textFieldEmail.snp.makeConstraints { make in
            make.top.equalTo(subTitle.snp.bottom).offset(flexibleHeight(to: 32))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
            make.height.equalTo(flexibleWidth(to: 48))
            make.width.equalTo(flexibleWidth(to: 361))
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldEmail.snp.bottom).offset(flexibleHeight(to: 64))
            make.width.equalTo(flexibleWidth(to: flexibleWidth(to: 361)))
            make.height.equalTo(flexibleHeight(to: 48))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
