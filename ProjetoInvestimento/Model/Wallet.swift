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
    var returnValue: Double
    var caixaWallet: [String: Int]
    var listSiglas = ["ARS","USD","EUR","AUD","GBP","CAD","JPY","BTC","CNY"]
    
    //MARK: - Constructor
    
    init() {
        self.saldo = 700
        self.returnValue = 0
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
        self.returnValue = Double(quantity) * value
        
        if tag == 1 {
            self.saldo -= self.returnValue
            self.caixaWallet[sigla] = valueCoins + quantity
        } else {
            self.saldo += self.returnValue
            self.caixaWallet[sigla] = valueCoins - quantity
        }
        return convert(value: returnValue)
    }
    
    func validationDataSell(exchange: Exchange, textField: String) -> Bool {

        return caixaWallet[exchange.sigla] ?? 0 > 0 && caixaWallet[exchange.sigla] ?? 0 >= Int(textField) ?? 0 && Double(caixaWallet[exchange.sigla] ?? 0) * exchange.venda >= exchange.venda && Int(textField) ?? 0 > 0 ? true : false
    }
    
    func validationDataBuy(exchange: Exchange, textField: String) -> Bool{
        
        return saldo >= exchange.compra * (Double(textField) ?? 0) && Int(textField) ?? 0 > 0  ? true : false
    }
  
}
