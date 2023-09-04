//
//  BaseViewController.swift
//  Threads
//
//  Created by Sultan on 2/8/23.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        addTargets()
        setupViews()
        setupConstraints()
    }
    
    func addTargets() {}
    
    func setupViews() {}
    
    func setupConstraints() {}
    
}
