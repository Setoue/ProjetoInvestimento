//
//  ExchangeTableViewCell.swift
//  ProjetoInvestimento
//
//  Created by user on 17/10/22.
//

import UIKit

class ExchangeTableViewCell: UITableViewCell {

    //MARK: - Attributes
    
    static let identifier: String = "ExchangeTableViewCell"
    
    let cellScreen: ExchangeHomeTableViewCellScreen = ExchangeHomeTableViewCellScreen()
    
    //MARK: - Construct
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.cellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.cellScreen)
        self.configConstraints()
        self.selectionStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    public func changeExchangeCell(exchange: String){
        self.cellScreen.coinsLabel.text = exchange
    }
    public func changeVaritionCell(varition: String, color: UIColor){
        self.cellScreen.variationLabel.text = varition
        self.cellScreen.variationLabel.textColor = color
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
        
            //cellScreen
            self.cellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.cellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.cellScreen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.cellScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        
        ])
    }
}
