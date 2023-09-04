//
//  CustomBottomSheet.swift
//  Threads
//
//  Created by Sultan on 18/8/23.
//

import UIKit
import SnapKit

class CustomBottomSheet : UIView {
    
    let setProfilePicture: UIButton = {
        let button = UIButton()
        button.setTitle("New profile picture", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = R.font.sfProDisplayBold(size: 17)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    let removeProfilePicture: UIButton = {
        let button = UIButton()
        button.setTitle("Remove current picture", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = R.font.sfProDisplayBold(size: 17)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    let setPictureIcon : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "setImage")
        return image
    }()
    
    let removePictureIcon : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "removeDelete")
        return image
    }()
    
    override func layoutSubviews() {
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = flexibleHeight(to: 12)
        addSubview(setProfilePicture)
        addSubview(removeProfilePicture)
        addSubview(setPictureIcon)
        addSubview(removePictureIcon)
        setupConstraints()
        
    }
    
    func setupConstraints() {
        
        setProfilePicture.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 30))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().inset(flexibleWidth(to: 16))
//            make.bottom.equalToSuperview().inset(flexibleHeight(to: 76))
        }
        
        removeProfilePicture.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 86))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 16))
            make.trailing.equalToSuperview().inset(flexibleWidth(to: 16))
//            make.bottom.equalToSuperview().inset(flexibleHeight(to: 20))
        }
        
        setPictureIcon.snp.makeConstraints{ make in
            make.top.equalTo(setProfilePicture.snp.top).inset(flexibleHeight(to: 10))
            make.leading.equalTo(setProfilePicture.snp.leading).inset(flexibleWidth(to: 16))
            make.trailing.equalTo(setProfilePicture.snp.trailing).inset(flexibleWidth(to: 321))
            make.bottom.equalTo(setProfilePicture.snp.bottom).inset(flexibleHeight(to: 10))
        }
        
        removePictureIcon.snp.makeConstraints{ make in
            make.top.equalTo(removeProfilePicture.snp.top).inset(flexibleHeight(to: 10))
            make.leading.equalTo(removeProfilePicture.snp.leading).inset(flexibleWidth(to: 16))
            make.trailing.equalTo(removeProfilePicture.snp.trailing).inset(flexibleWidth(to: 321))
            make.bottom.equalTo(removeProfilePicture.snp.bottom).inset(flexibleHeight(to: 10))
        }
        
    }
    
}
