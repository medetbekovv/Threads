//
//  BaseView.swift
//  Threads
//
//  Created by Sultan on 2/8/23.
//

import UIKit
import SnapKit

class BaseView : UIView {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
        
    func setupViews() {}
    func setupConstraints() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
