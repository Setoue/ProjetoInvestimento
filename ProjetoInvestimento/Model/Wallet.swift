//
//  Wallet.swift
//  ProjetoInvestimento
//
//  Created by user on 28/10/22.
//

import Foundation

class Wallet {

    //MARK: - Attributes
    
    var saldo: Double
    var caixaWallet: [String: Int]
    var listSiglas = ["ARS","USD","EUR","AUD","GBP","CAD","JPY","BTC","CNY"]
    
    //MARK: - Constructor
    
    init() {
        self.saldo = 700
        var caixaWallet = [String: Int]()
    
        for coins in listSiglas{
            caixaWallet[coins] = 0
        }
        self.caixaWallet = caixaWallet
    }
    
    //MARK: - Methods
    
    func convert(value: Double) -> String{
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.currencyCode = "BRL"
        guard let numberFormat = format.string(from: NSNumber(value: value)) else { return "R$0,00"}
        return numberFormat
    }
    
    func BuyOrSell(_ quantity: Int, ofValue value: Double,your sigla: String, and tag: Int) -> String{
        guard let valueCoins = self.caixaWallet[sigla] else { return ""}
        
        if tag == 1 {
            let allSell = Double(quantity) * value
            self.saldo -= allSell
            self.caixaWallet[sigla] = valueCoins + quantity
        } else {
            let allSell = Double(quantity) * value
            self.saldo += allSell
            self.caixaWallet[sigla] = valueCoins - quantity
        }
        
        return convert(value: saldo)
    }
}
