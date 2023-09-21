//
//  ThreadViewContrller.swift
//  Threads
//
//  Created by Sultan on 4/9/23.
//

import UIKit
import SnapKit
import RswiftResources

class ThreadViewContrller : BaseViewController {
    
    private let contentView = ThreadView()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        addTargets()
        setupViews()
        setupConstraints()
    }
    
    override func addTargets() {
        contentView.backButton.addTarget(self, action: #selector(exiteButtonPressed), for: .touchUpInside)
    }
    
    @objc func exiteButtonPressed() {
        dismiss(animated: true,completion: nil)
    }
    
    override func setupViews() {
        view.addSubview(contentView)
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        contentView.tableView.register(CustomThreadCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension ThreadViewContrller: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomThreadCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
