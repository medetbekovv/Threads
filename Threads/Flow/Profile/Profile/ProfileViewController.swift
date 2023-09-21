//
//  ProfileViewController.swift
//  Threads
//
//  Created by Sultan on 14/8/23.
//

import UIKit
import SnapKit

class ProfileViewController : UIViewController {
    
    let contentView = ProfileView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        var image = UIImage(named: "navigateBur")?.withTintColor(.black)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "asd", image: image, target: self, action: #selector(navigationButton))
        navigationController?.navigationBar.tintColor = .label
        
        addTargets()
        setupViews()
        setupConstraints()
    }
    
    @objc func navigationButton() {
        let vc = LoginViewController(loginProtocol: LoginViewModel())
          navigationController?.pushViewController(vc, animated: true)
      }
    
  
    
     func addTargets() {
         contentView.editButton.addTarget(self, action: #selector(editeButtonNavigation), for: .touchUpInside)
     }
    
    
    @objc private func editeButtonNavigation() {
        let vc = EditProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
     func setupViews() {
        view.addSubview(contentView)
    }
    
     func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
