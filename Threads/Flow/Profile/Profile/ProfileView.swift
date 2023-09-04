//
//  ProfileView.swift
//  Threads
//
//  Created by Sultan on 14/8/23.
//

import UIKit
import SnapKit

class ProfileView : BaseView {
    
    private lazy var userImage : UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = flexibleHeight(to: 100)
        image.image = UIImage(named: "profilePhoto")
        
        return image
    }()
    
    private lazy var title : UILabel = {
        let label = UILabel()
        label.text = "Design lead"
        label.font = R.font.sfProDisplayBold(size: 24)
        return label
    }()
    
    private lazy var subTitle : UILabel = {
        let label = UILabel()
        label.text = "malevicz"
        label.font = R.font.sfProDisplayBold(size: 14)
        return label
    }()
    
    private lazy var threadsNet : UIButton = {
        let button = UIButton()
        button.setTitle("threads.net", for: .normal)
        button.titleLabel?.font = R.font.sfProDisplayBlack(size: 11)
        button.setTitleColor(UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        button.layer.cornerRadius = flexibleWidth(to: 8)
        return button
    }()
    
    private lazy var follows : UILabel = {
        let label = UILabel()
        label.text = "18 followers"
        label.font = R.font.sfProDisplayLight(size: 15)
        label.textColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        return label
    }()
    
     lazy var editButton : UIButton = {
        let button = UIButton()
        button.setTitle("Edit profile", for: .normal)
        button.titleLabel?.font = R.font.sfProDisplayMedium(size: 15)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1).cgColor
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        return button
    }()
    
    private lazy var shareProfieButton : UIButton = {
        let button = UIButton()
        button.setTitle("Share profile", for: .normal)
        button.titleLabel?.font = R.font.sfProDisplayMedium(size: 15)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1).cgColor
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        return button
    }()
    
    private lazy var threadsLabel : UILabel = {
        let label = UILabel()
        label.text = "Threads"
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var repostImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "repostIcon")
        return image
    }()
    
    private lazy var repostLabel : UILabel = {
        let label = UILabel()
        label.text = "You reposted"
        label.textColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        label.font = R.font.sfProDisplayRegular(size: 15)
        return label
    }()
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(CustomProfileCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        tableView.dataSource = self
        tableView.delegate = self
        backgroundColor = .white
//        tableView.estimatedRowHeight = 105
        setupViews()
        setupConstraints()
    }
        
    override func setupViews() {
        addSubview(userImage)
        addSubview(title)
        addSubview(subTitle)
        addSubview(threadsNet)
        addSubview(follows)
        addSubview(editButton)
        addSubview(shareProfieButton)
        addSubview(threadsLabel)
        addSubview(lineView)
        addSubview(repostImage)
        addSubview(repostLabel)
        addSubview(tableView)
    }
    override func setupConstraints() {
        
        userImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 114))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
            make.height.equalTo(flexibleHeight(to: 70))
            make.width.equalTo(flexibleWidth(to: 70))
        }
        
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 126))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 22))
        }
        
        subTitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(flexibleHeight(to: 14))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 18))
        }
        
        threadsNet.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(flexibleHeight(to: 10))
            make.leading.equalTo(subTitle.snp.trailing).offset(flexibleWidth(to: 4))
            make.width.equalTo(flexibleWidth(to: 67))
        }
        
        follows.snp.makeConstraints { make in
            make.top.equalTo(subTitle.snp.bottom).offset(flexibleHeight(to: 16))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 18))
        }
        
        editButton.snp.makeConstraints { make in
            make.top.equalTo(follows.snp.bottom).offset(flexibleHeight(to: 20))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 16))
            make.height.equalTo(flexibleHeight(to: 36))
            make.width.equalTo(flexibleWidth(to: 172))
        }
        
        shareProfieButton.snp.makeConstraints { make in
           make.leading.equalTo(editButton.snp.trailing).offset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -16))
            make.top.equalTo(follows.snp.bottom).offset(flexibleHeight(to: 20))
            make.height.equalTo(flexibleHeight(to: 36))
            make.width.equalTo(flexibleWidth(to: 172))
        }
        
        threadsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 312))
            make.centerX.equalToSuperview()
            make.height.equalTo(flexibleHeight(to: 27))
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(threadsLabel.snp.bottom).offset(flexibleHeight(to: 9))
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(flexibleHeight(to: 1))
        }
        
        repostImage.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(flexibleHeight(to: 20))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 24))
        }
        
        repostLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(flexibleHeight(to: 20))
            make.leading.equalTo(repostImage.snp.trailing).inset(flexibleWidth(to: -10))
        }
        
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(repostLabel.snp.bottom).offset(flexibleHeight(to: 4))
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 85))
        }
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let model = ["sfkdjlgksdlfghjzxczxczasdasdkasbdhjbasljhdbsajhbdjhasbdjhabsdjhbashjdbashjdxczxczxczxczxczxczxczxczxczxczxczxczxxzczxczxczxczxczxczxczxc", "let cell = tableView.dequeueReusableCell(withIdentifier:, for: indexPath) as! CustomProfileCellzxczxczxczxczxczxasdaasdasdasdasdasdasdasdasdasdasdasasdvafafaasfasdasdasdasdsdasdasdasdasdasdczxczxczxc", "dsfsdfsdfskjdfnjsdkfnsdfksdnfksdjfnksndjfksndfjskdnfdsfsdfsdfskjdfnjsdkfnsdfksdnfksdjfnksndjfksndfjskdnfda,sjndasbdasbdabsdmnbasmndbasmbdamnsbdnmasbdmnbasdmbasmndbasmbdamnsbdmnasbdmbasdmbasmdbasmbdamnsbdmnasbdmnabsdmbasmdbasmndbasmbdmansbdmanbsdmbasmdnbasmdnbamnsbdmansbdmabsdmnasdsfsdfsdfskjdfnjsdkfnsdfksdnfksdjfnksndjfksndfjskdnf"]
    
    
}

extension ProfileView : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomProfileCell
        cell.threadLabel.text = model[indexPath.row]
//        if indexPath.row%2==0 {
//            cell.backgroundColor = .green
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
  
    
}

//extension ProfileView : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellWidth = flexibleWidth(to: 393)
//        let cellHeight = flexibleHeight(to: 106)
//
//        return CGSize(width: cellWidth, height: cellHeight)
//    }
//
//
//
//
//
//}
