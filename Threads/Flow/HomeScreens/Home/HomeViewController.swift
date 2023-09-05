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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomHomeCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
