//
//  CustomSearchCell.swift
//  Threads
//
//  Created by Sultan on 6/9/23.
//

import UIKit
import SnapKit
import RswiftResources

class CustomSearchCell: UITableViewCell {
    
    var textOne: Int = 20
    
    lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "UserPicture")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 18 * UIScreen.main.bounds.width / 393
        
        return image
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "iamnalimov"
        label.font = R.font.sfProDisplayBold(size: 14)
        
        return label
    }()
    
    lazy var jobLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.sfProDisplayRegular(size: 15)
        label.text = "Art Director"
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: "GreyLabel")
        label.numberOfLines = 0
        
        return label
    }()

    lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.text = "49 followers"
        label.font = R.font.sfProDisplayRegular(size: 14)

        
        return label
    }()
    
    lazy var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = R.font.sfProDisplayMedium(size: 14)
        button.layer.cornerRadius = 8 * UIScreen.main.bounds.height / 852
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "GreyButtonBorder")?.cgColor
        
        return button
    }()
    
    private lazy var dividerLine: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.33
        view.layer.borderColor = UIColor(named: "GreyButtonBorder")?.cgColor
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(avatarImage)
        addSubview(usernameLabel)
        addSubview(jobLabel)
        addSubview(followersLabel)
        addSubview(followButton)
        addSubview(dividerLine)
    }
    
    func setupConstraints() {
        avatarImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 3))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 12))
            make.trailing.equalToSuperview().inset(flexibleWidth(to: 345))
            make.height.width.equalTo(flexibleWidth(to: 36))
        }

        usernameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 2))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 68))
        }

        jobLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(22)
            make.leading.equalToSuperview().inset(flexibleWidth(to: 68))
        }
        
        followersLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(54)
            make.leading.equalToSuperview().inset(flexibleWidth(to: 68))
        }
        
        followButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(3)
            make.leading.equalToSuperview().inset(flexibleWidth(to: 281))
            make.trailing.equalToSuperview().inset(flexibleWidth(to: 16))
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 57))
        }
        
        dividerLine.snp.makeConstraints { make in
            make.top.equalTo(followersLabel.snp.bottom).offset(8.7)
            make.leading.equalToSuperview().inset(flexibleWidth(to: 64))
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 9))
        }
    }
}
