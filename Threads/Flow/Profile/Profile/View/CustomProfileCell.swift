//
//  CustomCell.swift
//  Threads
//
//  Created by Sultan on 17/8/23.
//

import UIKit
import SnapKit

class CustomProfileCell : UITableViewCell {
    
    private lazy var avatarImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profilePhoto")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var userNameLabel : UILabel = {
        let label = UILabel()
        label.text = "mountain_mama"
        label.font = R.font.sfProDisplayBold(size: 14)
        return label
    }()
    
     lazy var threadLabel : UILabel = {
        let label = UILabel()
        label.font = R.font.sfProDisplayRegular(size: 15)
        label.text = "Innovation sets leaders apart from followers."
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var likeButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "likeIcon"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var commentButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "comments"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var repostButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "repost"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var sendButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "send"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var timeLabel : UILabel = {
        let label = UILabel()
        label.text = "3m"
        label.textColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        label.font = R.font.sfProDisplayRegular(size: 14)
        return label
    }()
    
    private lazy var likesLabel : UILabel = {
        let label = UILabel()
        label.text = "87 likes"
        label.font = R.font.sfProDisplayRegular(size: 14)
        label.textColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//        setupConstraints()
//
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        
        addSubview(avatarImage)
        addSubview(userNameLabel)
        addSubview(threadLabel)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(repostButton)
        addSubview(sendButton)
        addSubview(timeLabel)
        addSubview(likesLabel)
        
    }
    
    func setupConstraints() {
        
        avatarImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 5))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 12))
            make.trailing.equalToSuperview().inset(flexibleWidth(to: 345))
        }

        userNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 5))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 60))
            make.trailing.equalToSuperview().inset(flexibleWidth(to: 227))
            make.height.equalTo(flexibleHeight(to: 18))
        }
        
        threadLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(flexibleHeight(to: 3))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 60))
            make.trailing.equalToSuperview().inset(flexibleWidth(to: 12))
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(threadLabel.snp.bottom).offset(flexibleHeight(to: 15))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 60))
       }
        
        commentButton.snp.makeConstraints { make in
            make.top.equalTo(threadLabel.snp.bottom).offset(flexibleHeight(to: 15))
            make.leading.equalTo(likeButton.snp.trailing).offset(flexibleWidth(to: 16))
        }

        repostButton.snp.makeConstraints { make in
            make.top.equalTo(threadLabel.snp.bottom).offset(flexibleHeight(to: 15))
            make.leading.equalTo(commentButton.snp.trailing).offset(flexibleWidth(to: 16))
        }

        sendButton.snp.makeConstraints { make in
            make.top.equalTo(threadLabel.snp.bottom).offset(flexibleHeight(to: 15))
            make.leading.equalTo(repostButton.snp.trailing).offset(flexibleWidth(to: 16))

        }

        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(flexibleWidth(to: 21))
        }

        likesLabel.snp.makeConstraints { make in
            make.top.equalTo(likeButton.snp.bottom).offset(flexibleHeight(to: 12))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 60))
            make.bottom.equalToSuperview()
        }
    }
        
}



 
    

    

