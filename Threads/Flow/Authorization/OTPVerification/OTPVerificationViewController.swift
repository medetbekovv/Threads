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
    
    override func viewDidLoad() {
        super .viewDidLoad()
        view.backgroundColor = .white
        
        contentView.otpView.delegate = self
        
        addTargets()
        setupViews()
        setupConstraints()
    }
    
    override func addTargets() {}
    
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

 
