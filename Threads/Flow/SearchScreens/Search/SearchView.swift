//
//  SearchView.swift
//  Threads
//
//  Created by Sultan on 6/9/23.
//

import UIKit
import SnapKit
import RswiftResources


class SearchView : BaseView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Search"
        label.font = R.font.sfProDisplayBold(size: 34)
        
        return label
    }()
    
    lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "Search"
        bar.backgroundImage = UIImage()
        bar.searchTextField.leftView = createEmptyLeftView(size: CGSize(width: 25, height: 25))
        bar.searchTextField.leftViewMode = .always
        bar.searchTextField.clearButtonMode = .always
        
        return bar
    }()

    func createEmptyLeftView(size: CGSize) -> UIView {
        let leftView = UIView(frame: CGRect(origin: .zero, size: size))
        leftView.backgroundColor = .clear
        
        return leftView
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(CustomSearchCell.self, forCellReuseIdentifier: "MyCellReuseIdentifier")

        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        backgroundColor = UIColor(named: "ScreenBackground")
        tableView.dataSource = self
        tableView.delegate = self
        setupViews()
        setupConstraints()
    }
    
    override func setupViews() {
        addSubview(titleLabel)
        addSubview(searchBar)
        addSubview(tableView)
    }
    
    override func setupConstraints() {
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(flexibleHeight(to: 67))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 16))
//            make.bottom.equalToSuperview().inset(flexibleHeight(to: 744))
        }
        
        searchBar.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).inset(flexibleHeight(to: 9))
            make.leading.equalToSuperview().inset(flexibleWidth(to: 4))
            make.trailing.equalToSuperview().inset(flexibleHeight(to: 4))
//            make.bottom.equalToSuperview().inset(flexibleHeight(to: 699))
        }
        
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(searchBar.snp.bottom).offset(flexibleHeight(to: 6))
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(flexibleHeight(to: 104))
        }
    }
}

extension SearchView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCellReuseIdentifier", for: indexPath) as! CustomSearchCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}


