//
//  ThreadView.swift
//  Threads
//
//  Created by Sultan on 4/9/23.
//

import UIKit
import SnapKit
import RswiftResources

class ThreadView : BaseView {
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Thread"
        label.font = R.font.sfProDisplayBold(size: 20)
        return label
    }()
    
     lazy var backButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "BackIcon"), for: .normal)
        return button
    }()
    
    private lazy var dividerLine : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        return view
    }()
    
    private lazy var avatarImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profilePhoto")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var userNameLabel : UILabel = {
        let label = UILabel()
        label.text = "iamnalimov"
        label.font = R.font.sfProDisplayBold(size: 14)
        return label
    }()
    
    private lazy var threadLabel : UILabel = {
        let label = UILabel()
        label.font = R.font.sfProDisplayRegular(size: 15)
        label.text = "Innovation sets leaders apart from followers. asdasdasddasfsafasfasfsdafsafdsafsf"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var postImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "StiveJobsImages")
        image.contentMode = .scaleAspectFit
        return image
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
    
    private lazy var replyLabel : UILabel = {
        let label = UILabel()
        label.text = "1 reply"
        label.font = R.font.sfProDisplayRegular(size: 15)
        label.textColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        return label
    }()
    
    lazy var dividerDot: UILabel = {
        let label = UILabel()
        label.text = "•"
        label.textColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        return label
    }()
    
    private lazy var likesLabel : UILabel = {
        let label = UILabel()
        label.text = "87 likes"
        label.font = R.font.sfProDisplayRegular(size: 14)
        label.textColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        return label
    }()
    
    private lazy var commentDividerLine : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        return view
    }()
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
//        tableView.register(CustomThreadCell.self,forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    lazy var replyTextField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        textField.placeholder = "Reply to iamnalimov"
        textField.layer.cornerRadius = flexibleHeight(to: 22)
        textField.font = R.font.sfProDisplayRegular(size: 14)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 42, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var replyAvatarImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "EditeProfilePhoto")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .white
        setupViews()
        setupConstraints()
    }
        
    override func setupViews() {
        addSubview(titleLabel)
        addSubview(backButton)
        addSubview(dividerLine)
        addSubview(avatarImage)
        addSubview(userNameLabel)
        addSubview(threadLabel)
        addSubview(postImage)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(repostButton)
        addSubview(sendButton)
        addSubview(timeLabel)
        addSubview(replyLabel)
        addSubview(dividerDot)
        addSubview(likesLabel)
        addSubview(commentDividerLine)
        addSubview(tableView)
        addSubview(replyTextField)
        addSubview(replyAvatarImage)
    }
    
    override func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 72))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 56))
            
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 72))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 16))
        }
        
        dividerLine.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(flexibleHeight(to: 18))
            make.height.equalTo(flexibleHeight(to: 1))
            make.leading.trailing.equalToSuperview()
        }
        
        avatarImage.snp.makeConstraints { make in
            make.top.equalTo(dividerLine.snp.bottom).offset(flexibleHeight(to: 20))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 13.5))
            make.height.width.equalTo(flexibleHeight(to: 36))
            
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(dividerLine.snp.bottom).offset(flexibleHeight(to: 29))
            make.leading.equalTo(avatarImage.snp.trailing).offset(flexibleWidth(to: 10))
            make.height.equalTo(flexibleHeight(to: 18))
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(dividerLine.snp.bottom).offset(flexibleHeight(to: 29))
            make.trailing.equalToSuperview().inset(flexibleWidth(to: 21.5))
            make.height.equalTo(flexibleHeight(to: 18))
        }
        
        threadLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(flexibleHeight(to: 25))
            make.leading.trailing.equalToSuperview().inset(flexibleWidth(to: 16))
        }
        
        postImage.snp.makeConstraints { make in
            make.top.equalTo(threadLabel.snp.bottom).offset(flexibleHeight(to: 15))
            make.leading.trailing.equalToSuperview().inset(flexibleWidth(to: 16))
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(postImage.snp.bottom).offset(flexibleHeight(to: 15))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 20))
        }
        
        commentButton.snp.makeConstraints { make in
            make.top.equalTo(postImage.snp.bottom).offset(flexibleHeight(to: 15))
            make.leading.equalTo(likeButton.snp.trailing).offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 20))
        }
        
        repostButton.snp.makeConstraints { make in
            make.top.equalTo(postImage.snp.bottom).offset(flexibleHeight(to: 15))
            make.leading.equalTo(commentButton.snp.trailing).offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 20))
        }
        
        sendButton.snp.makeConstraints { make in
            make.top.equalTo(postImage.snp.bottom).offset(flexibleHeight(to: 15))
            make.leading.equalTo(repostButton.snp.trailing).offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 20))
        }
        
        replyLabel.snp.makeConstraints { make in
            make.top.equalTo(sendButton.snp.bottom).offset(flexibleHeight(to: 12))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 16))
        }
        
        dividerDot.snp.makeConstraints{ make in
            make.centerY.equalTo(replyLabel.snp.centerY)
            make.leading.equalTo(replyLabel.snp.trailing).offset(flexibleWidth(to: 5))
        }
        
        likesLabel.snp.makeConstraints{ make in
            make.top.equalTo(sendButton.snp.bottom).offset(flexibleHeight(to: 12))
            make.leading.equalTo(dividerDot.snp.trailing).offset(flexibleWidth(to: 5))
        }
        
        commentDividerLine.snp.makeConstraints { make in
            make.top.equalTo(likesLabel.snp.bottom).offset(flexibleHeight(to: 14))
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(flexibleHeight(to: 0.5))
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(commentDividerLine.snp.bottom).offset(flexibleHeight(to: 14))
            make.leading.trailing.equalToSuperview()
//            make.height.equalTo(77)
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 98))
        }
        
        replyTextField.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 777))
            make.leading.trailing.equalToSuperview().inset(flexibleHeight(to: 16))
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 31))
        }
        
        replyAvatarImage.snp.makeConstraints{ make in
            make.top.equalTo(replyTextField.snp.top).offset(flexibleHeight(to: 10))
            make.leading.equalTo(replyTextField.snp.leading).offset(flexibleHeight(to: 10))
            make.trailing.equalTo(replyTextField.snp.trailing).inset(flexibleHeight(to: 327))
            make.bottom.equalTo(replyTextField.snp.bottom).inset(flexibleHeight(to: 10))
        }
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
