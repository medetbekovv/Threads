//
//  SearchViewController.swift
//  Threads
//
//  Created by Sultan on 21/9/23.
//

import UIKit
import SnapKit

class SearchViewController : BaseViewController {
    
    let users = [SearchModel(usernameLabel: "iamnalimov", avatarImage: UIImage(named: "image11")!, jobLabel: "developer", followersLabel: "55 follewers"),
                 SearchModel(usernameLabel: "medetbekov.sultan", avatarImage: UIImage(named: "StiveJobsImages")!, jobLabel: "ios develop", followersLabel: "128 follewers"),
                 SearchModel(usernameLabel: "Gudini", avatarImage: UIImage(named: "image11")!, jobLabel: "company", followersLabel: "5155 follewers"),
                 SearchModel(usernameLabel: "Apple", avatarImage: UIImage(named: "image11")!, jobLabel: "apple complany", followersLabel: "564k follewers"),
                 SearchModel(usernameLabel: "usmanova", avatarImage: UIImage(named: "usmanova")!, jobLabel: "", followersLabel: "234 follewers"),
                 SearchModel(usernameLabel: "Neobis", avatarImage: UIImage(named: "neobis")!, jobLabel: "neobis company", followersLabel: "12k follewers"),
                 SearchModel(usernameLabel: "Outtalent", avatarImage: UIImage(named: "image11")!, jobLabel: "company", followersLabel: "5k follewers"),
                 
    ]
    
    let contentView = SearchView()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        addTargets()
        setupViews()
        setupConstraints()
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
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


extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCellReuseIdentifier", for: indexPath) as! CustomSearchCell
        
        let user = users[indexPath.row]
        
        cell.usernameLabel.text = user.usernameLabel
        cell.avatarImage.image = user.avatarImage
        cell.jobLabel.text = user.jobLabel
        cell.followersLabel.text = user.followersLabel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Ячейка выбрана")
        let vc = SomeoneProfileViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        print("Попытка перехода выполнена")

    }
    
}
