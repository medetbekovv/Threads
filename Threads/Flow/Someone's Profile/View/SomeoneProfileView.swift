//
//  SomeoneProfileView.swift
//  Threads
//
//  Created by Sultan on 3/10/23.
//

import UIKit
import SnapKit

class SomeoneProfileView: BaseView {
    
    lazy var professionLabel: UILabel = {
        let label = UILabel()
        label.text = "Alex Elle"
        label.font = R.font.sfProDisplayBold(size: 24)
        
        return label
    }()
    
    lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "alex_elle"
        label.font = R.font.sfProDisplayBold(size: 14)
        
        return label
    }()
    
    lazy var threadsNet : UIButton = {
        let button = UIButton()
        button.setTitle("threads.net", for: .normal)
        button.titleLabel?.font = R.font.sfProDisplayBlack(size: 11)
        button.setTitleColor(UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        button.layer.cornerRadius = flexibleWidth(to: 8)
        return button
   }()
    
    lazy var profilePicture: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "EditeProfilePhoto")
        image.clipsToBounds = true
        image.layer.cornerRadius = flexibleWidth(to: 35)
        return image
    }()
    
    lazy var followersLabel: UIButton = {
        let button = UIButton()
        button.setTitle("153k followers", for: .normal)
        button.titleLabel?.font = R.font.sfProDisplayRegular(size: 15)
        button.setTitleColor(UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1), for: .normal)
        
        return button
    }()
    
    lazy var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = R.font.sfProDisplayRegular(size: 15)
        button.layer.cornerRadius = flexibleHeight(to: 8)
        button.backgroundColor = .black
        
        return button
    }()
    
    lazy var threadLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.sfProDisplayMedium(size: 15)
        label.text = "Threads"
        
        return label
    }()
    
    lazy var dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    lazy var repostImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "repostIcon")
        
        return image
    }()
    
    lazy var repostLabel: UILabel = {
        let label = UILabel()
        label.text = "You reposted"
        label.textColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        label.font = R.font.sfProDisplayRegular(size: 15)
        
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(SomeoneProfileCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    lazy var bottomSheet: CustomBottomShareSheet = {
        let view = CustomBottomShareSheet()
        return view
    }()
    
    lazy var overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.isHidden = true
        
        return view
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .white
        setupViews()
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
    }
        
    override func setupViews() {
        addSubview(professionLabel)
        addSubview(nicknameLabel)
        addSubview(threadsNet)
        addSubview(profilePicture)
        addSubview(followersLabel)
        addSubview(followButton)
        addSubview(threadLabel)
        addSubview(dividerLine)
        addSubview(repostImage)
        addSubview(repostLabel)
        addSubview(tableView)
        addSubview(overlayView)
        addSubview(bottomSheet)
    }
    override func setupConstraints() {
        
        professionLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 126))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 16))
        }
        
        nicknameLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 162))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 16))
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 672))
        }
        
        threadsNet.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 158))
            make.leading.equalTo(nicknameLabel.snp.trailing).offset(flexibleWidth(to: 4))
            make.width.equalTo(flexibleWidth(to: 67))
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 668))
        }
    
        
        profilePicture.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 114))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 307))
            make.width.equalTo(flexibleWidth(to: 70))
            make.height.equalTo(flexibleWidth(to: 70))
        }
        
        followersLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 196))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 16))
            //            make.trailing.equalToSuperview().inset(flexibleWidth(to: 305))
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 638))
        }
        
        followButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 234))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().inset(flexibleWidth(to: 16))
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 582))
        }
        
        threadLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 294))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 531))
        }
        
        dividerLine.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 330))
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 521))
        }
        
        repostImage.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 352.5))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 24))
            make.trailing.equalToSuperview().inset(flexibleWidth(to: 349))
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 479.5))
        }
        
        repostLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 349))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 54))
            make.trailing.equalToSuperview().inset(flexibleWidth(to: 256))
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 476))
        }
        
        tableView.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 380))
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 83))
        }
        
        bottomSheet.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(flexibleHeight(to: 209))
            make.top.equalToSuperview().offset(UIScreen.main.bounds.height)
        }
        
        overlayView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let model = ["Innovation sets leaders apart from followers.", "When I look at you, I see someone who’s working hard"]

    
}


extension SomeoneProfileView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension SomeoneProfileView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SomeoneProfileCell
        
        cell.threadLabel.text = model[indexPath.row]
//        if indexPath.row%2==0{
//        }
        return cell
    }
    
    
}
