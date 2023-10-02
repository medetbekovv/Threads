//
//  SearchViewController.swift
//  Threads
//
//  Created by Sultan on 21/9/23.
//

import UIKit
import SnapKit

class SearchViewController : BaseViewController {
    
    let contentView = SearchView()
    
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

