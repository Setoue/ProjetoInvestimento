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
        var _caixaWallet = [String: Int]()
        
        for coins in listSiglas{
            _caixaWallet[coins] = 0
        }
        self.caixaWallet = _caixaWallet
    }
    
    //MARK: - Methods
    
    func convert(value: Double) -> String{
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.currencyCode = "BRL"
        
        guard let numberFormat = format.string(from: NSNumber(value: value)) else { return "R$0,00"}
        return numberFormat
    }
    
    func sell(quantity: Int, valueSell: Double, sigla: String) -> String{
        guard let valueCoins = self.caixaWallet[sigla] else { return ""}
        
        let allSell = Double(quantity) * valueSell
        self.saldo += allSell
        self.caixaWallet[sigla] = valueCoins - quantity
        return convert(value: saldo)
    }
    
    func buy(quantity: Int, valueBuy: Double, sigla: String) -> String{
        guard let valueCoins = self.caixaWallet[sigla] else { return ""}
        
        let allSell = Double(quantity) * valueBuy
        self.saldo -= allSell
        self.caixaWallet[sigla] = valueCoins + quantity
        return convert(value: saldo)
    }
}
