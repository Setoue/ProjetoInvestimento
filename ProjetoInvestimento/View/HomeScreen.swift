//
//  HomeScreen.swift
//  ProjetoInvestimento
//
//  Created by user on 17/10/22.
//

import UIKit

class HomeScreen: UIView {

    //MARK: - Elementos
    
    lazy var body: UIView = {
        let body = UIView()
        body.translatesAutoresizingMaskIntoConstraints = false
        body.backgroundColor = .black
        body.addSubview(self.tableView)
        return body
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.register(ExchangeTableViewCell.self, forCellReuseIdentifier: ExchangeTableViewCell.identifier)
        return tableView
    }()

    //MARK: - Construct
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.body)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    public func delegateTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            //tableView
            self.tableView.topAnchor.constraint(equalTo: self.body.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.body.leadingAnchor, constant: 20),
            self.tableView.trailingAnchor.constraint(equalTo: self.body.trailingAnchor, constant: -20),
            self.tableView.bottomAnchor.constraint(equalTo: self.body.bottomAnchor),
            
            //body
            self.body.topAnchor.constraint(equalTo: self.topAnchor),
            self.body.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.body.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.body.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}

