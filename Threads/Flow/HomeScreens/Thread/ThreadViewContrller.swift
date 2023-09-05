//
//  ThreadViewContrller.swift
//  Threads
//
//  Created by Sultan on 4/9/23.
//

import UIKit
import SnapKit
import RswiftResources

class ThreadViewContrller : BaseViewController {
    
    private let contentView = ThreadView()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
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
