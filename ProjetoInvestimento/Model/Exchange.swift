//
//  Exchange.swift
//  ProjetoInvestimento
//
//  Created by user on 27/10/22.
//

import UIKit

struct Exchange {

    var coins: String
    var sigla: String
    var variation: String
    var compra: Double
    var venda: Double
    var color: UIColor
    
    init(coins: String, sigla: String, variation: String, compra: Double, venda: Double, color: UIColor) {
        self.coins = coins
        self.sigla = sigla
        self.variation = variation
        self.compra = compra
        self.venda = venda
        self.color = color

    }
    
}
