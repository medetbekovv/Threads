//
//  OTPVerificationView.swift
//  Threads
//
//  Created by Sultan on 10/8/23.
//

import UIKit
import SnapKit
import AEOTPTextField

class OTPVerificationView : BaseView {
    
    private lazy var title : UILabel = {
        let label = UILabel()
        label.font = R.font.sfProDisplayBold(size: 34)
        label.text = "OTP Verification"
        return label
    }()
    
    private lazy var subTitle : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Check your email to see the verification code"
        label.font = R.font.sfProDisplayMedium(size: 17)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)
        return label
    }()
    
    lazy var otpView : AEOTPTextField = {
        let otp = AEOTPTextField()
        otp.otpCornerRaduis = 8
        otp.textColor = .black
        otp.configure(with: 4)
        
        return otp
    }()
    


    
    private lazy var verifyButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Verify", for: .normal)
        button.backgroundColor = UIColor.black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var sendAgainButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send again", for: .normal)
        button.setTitleColor(.black, for: .normal)
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
        addSubview(otpView)
        addSubview(verifyButton)
        addSubview(sendAgainButton)
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
        
        otpView.snp.makeConstraints { make in
            make.top.equalTo(subTitle.snp.bottom).offset(flexibleHeight(to: 32))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 48))
            make.width.equalTo(flexibleWidth(to: 256))
            
        }
        
        verifyButton.snp.makeConstraints { make in
            make.top.equalTo(otpView.snp.bottom).offset(flexibleHeight(to: 64))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 48))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
        }
        
        sendAgainButton.snp.makeConstraints { make in
            make.top.equalTo(verifyButton.snp.bottom).offset(flexibleHeight(to: 18))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 158))
           
            
        }
        
        
        

        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
 
