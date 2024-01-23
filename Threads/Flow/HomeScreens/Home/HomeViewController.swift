//
//  HomeViewController.swift
//  Threads
//
//  Created by Sultan on 1/9/23.
//

import UIKit
import SnapKit
import RswiftResources


class HomeViewController : BaseViewController {
    
    let contentView = HomeView()
    
    let treads = [Thread(usernameLabel: "iamnalimov", avatarImage: UIImage(named: "image11")!, threadLabel: "Hello world", postImage: UIImage(named: "image11")!),
                  Thread(usernameLabel: "medetbekov.sultan", avatarImage:  UIImage(named: "StiveJobsImages")!, threadLabel: "Пока не упал духом, любые другие падения по плечу»", postImage:  UIImage(named: "image11")!),
                  Thread(usernameLabel: "Gudini", avatarImage:  UIImage(named: "StiveJobsImages")!, threadLabel: "Если до вашей планки не дотягиваются, это не повод ее занижать", postImage:  UIImage(named: "StiveJobsImages")!),
                  Thread(usernameLabel: "Apple", avatarImage:  UIImage(named: "StiveJobsImages")!, threadLabel: "", postImage:  UIImage(named: "image13")!),
                  Thread(usernameLabel: "usmanova", avatarImage:  UIImage(named: "usmanova")!, threadLabel: "Надо жить, надо любить, надо верить", postImage:  UIImage(named: "usmanova")!),
                  Thread(usernameLabel: "Neobis", avatarImage:  UIImage(named: "neobis")!, threadLabel: "Neobis — это отличный старт в IT-карьере. Здесь ты получишь уникальный опыт, поймешь, какие инструменты использовать и как работать в команде", postImage:  UIImage(named: "neobis1")!),
                  Thread(usernameLabel: "Outtalent", avatarImage:  UIImage(named: "StiveJobsImages")!, threadLabel: "Выбери работу, которую хочешь, мы доставим тебя туда" , postImage:  UIImage(named: "image14")!)
    ]
    
    override func viewDidLoad() {
        super .viewDidLoad()
        view.backgroundColor = .white
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
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

extension HomeViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return treads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomHomeCell
        
        let tread = treads[indexPath.row]
        
        cell.userNameLabel.text = tread.usernameLabel
        cell.avatarImage.image = tread.avatarImage
        cell.threadLabel.text = tread.threadLabel
        cell.postImage.image = tread.postImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = ThreadViewContrller()
        detailViewController.modalPresentationStyle = .fullScreen
        present(detailViewController, animated: true)
    }
    
}
