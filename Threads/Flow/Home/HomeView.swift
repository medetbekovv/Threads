//
//  HomeView.swift
//  Threads
//
//  Created by Sultan on 1/9/23.
//

import UIKit
import SnapKit
import RswiftResources

class HomeView : BaseView {
    
    private lazy var threadIcon : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Threads Logo")
        return image
    }()
    
    private lazy var forYouSection : UIButton = {
        let button = UIButton()
        button.setTitle("For you", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = R.font.sfProDisplayBold(size: 17)
        return button
    }()
    
    private lazy var forYouSectionLine : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var followingSection : UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = R.font.sfProDisplayBold(size: 17)
        return button
    }()
    
    private lazy var followingSectionLine : UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(CustomHomeCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setupViews() {
        addSubview(threadIcon)
        addSubview(forYouSection)
        addSubview(followingSection)
        addSubview(forYouSectionLine)
        addSubview(followingSectionLine)
        addSubview(tableView)
    }
    override func setupConstraints() {
        
        threadIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 62))
            make.centerX.equalToSuperview()
            make.height.width.equalTo(flexibleWidth(to: 35))
        }
        
        forYouSection.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 118))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 70))
            make.height.equalTo(flexibleHeight(to: 22))
        }
        
        followingSection.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 118))
            make.trailing.equalToSuperview().inset(flexibleWidth(to: 62))
            make.height.equalTo(flexibleHeight(to: 22))
        }
        
        forYouSectionLine.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 153))
            make.leading.equalToSuperview()
            make.width.equalTo(flexibleWidth(to: 197))
            make.height.equalTo(flexibleHeight(to: 1.5))
        }
        
        followingSectionLine.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 153))
            make.trailing.equalToSuperview()
            make.height.equalTo(flexibleHeight(to: 1))
            make.width.equalTo(flexibleWidth(to: 196))
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(forYouSectionLine.snp.bottom).offset(flexibleHeight(to: 20))
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 83))
        }
        
        
        
    }
}
