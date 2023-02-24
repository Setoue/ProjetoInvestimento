//
//  ExchangeHomeTableViewCellScreen.swift
//  ProjetoInvestimento
//
//  Created by user on 17/10/22.
//

import UIKit

class ExchangeHomeTableViewCellScreen: UIView {

    //MARK: - Elements
    
    lazy var coinsLabel: UILabel = {
        let coins = UILabel()
        coins.translatesAutoresizingMaskIntoConstraints = false
        coins.textColor = .white
        coins.text = "USD"
        coins.font = UIFont.boldSystemFont(ofSize: 20)
        coins.textAlignment = .left
        return coins
    }()
    
    lazy var variationLabel: UILabel = {
        let variation = UILabel()
        variation.translatesAutoresizingMaskIntoConstraints = false
        variation.textColor = .green
        variation.text = "0,53%"
        variation.font = UIFont.systemFont(ofSize: 20)
        variation.textAlignment = .right
        return variation
    }()


    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addSubview(self.coinsLabel)
        stackView.addSubview(self.variationLabel)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.white.cgColor
        stackView.layer.cornerRadius = 20
        return stackView
    }()

    //MARK: - Constructs
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addSubview(self.stackView)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            //stackView
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            //coinsLabel
            self.coinsLabel.centerYAnchor.constraint(equalTo: self.stackView.centerYAnchor),
            self.coinsLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 20),
            self.coinsLabel.trailingAnchor.constraint(equalTo: self.variationLabel.leadingAnchor),
            
            //variationLabel
            self.variationLabel.centerYAnchor.constraint(equalTo: self.stackView.centerYAnchor),
            self.variationLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: -20),
            self.variationLabel.leadingAnchor.constraint(equalTo: self.coinsLabel.trailingAnchor),

        ])
        
    }
    
}
