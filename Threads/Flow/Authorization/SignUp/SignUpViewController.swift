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
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        view.backgroundColor = .white
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
