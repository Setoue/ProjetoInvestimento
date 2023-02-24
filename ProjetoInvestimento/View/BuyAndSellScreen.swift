//
//  BuyAndSellScreen.swift
//  ProjetoInvestimento
//
//  Created by user on 25/10/22.
//

import UIKit

class BuyAndSellScreen: UIView {

    //MARK: - Elements
    
    lazy var labelFinal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 35)
        label.numberOfLines = 5
        label.textAlignment = .center
        return label
    }()
    
    lazy var buttonHome: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        button.backgroundColor = .systemCyan
        button.setTitle("HOME", for: .normal)
        return button
    }()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(self.labelFinal)
        addSubview(self.buttonHome)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    func changeData(label: String){
        self.labelFinal.text = label
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
        
            //labelFinal
            self.labelFinal.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.labelFinal.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -30),
            self.labelFinal.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.labelFinal.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            
            //buttonHome
            self.buttonHome.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.buttonHome.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -20),
            self.buttonHome.heightAnchor.constraint(equalToConstant: 60),
            self.buttonHome.widthAnchor.constraint(equalToConstant: 140),
            
        ])
    }

}
