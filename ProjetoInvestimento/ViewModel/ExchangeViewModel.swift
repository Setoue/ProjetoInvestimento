//
//  ExchangeViewModel.swift
//  ProjetoInvestimento
//
//  Created by user on 16/10/22.
//

import Foundation
import UIKit

class ExchangeViewModel {
    
    //MARK: - Attributes
    
    private var service: ExchangeProfileService = ExchangeProfileService()
    private var delegate: ExchangeViewModelDelegate?
    var allCoins = [Coins]()
    
    //MARK: - Methods
    
    public func delegate(delegate: ExchangeViewModelDelegate?){
        self.delegate = delegate
    }
    
    public func seek(){
        
        self.service.getExchangeFromAPI { success, error in
            
            if var _success = success {
                print("O obejto está sendo retornado")
                
                _success.results.currencies.ARS.sigla = "ARS"
                _success.results.currencies.USD.sigla = "USD"
                _success.results.currencies.EUR.sigla = "EUR"
                _success.results.currencies.AUD.sigla = "AUD"
                _success.results.currencies.GBP.sigla = "GBP"
                _success.results.currencies.CAD.sigla = "CAD"
                _success.results.currencies.JPY.sigla = "JPY"
                _success.results.currencies.BTC.sigla = "BTC"
                _success.results.currencies.CNY.sigla = "CNY"
                
                self.allCoins.append(_success.results.currencies.USD)
                self.allCoins.append(_success.results.currencies.EUR)
                self.allCoins.append(_success.results.currencies.ARS)
                self.allCoins.append(_success.results.currencies.AUD)
                self.allCoins.append(_success.results.currencies.GBP)
                self.allCoins.append(_success.results.currencies.CAD)
                self.allCoins.append(_success.results.currencies.JPY)
                self.allCoins.append(_success.results.currencies.BTC)
                self.allCoins.append(_success.results.currencies.CNY)
                
                self.delegate?.success()
                
            } else {
                self.delegate?.error(mensage: error?.localizedDescription ?? "")
            }
        }
    }
    
    public func returnCount() -> Int{
        return self.allCoins.count
    }
    
    public func nameExchange(indexPath: Int) -> String{
        return self.allCoins[indexPath].sigla ?? ""
    }
    public func returnVariationPercent(indexPath: Int) -> String{
        let _variation = String(self.allCoins[indexPath].variation)
        return "\(_variation)%"
    }
    
    public func returnVariationColor(indexPath: Int) -> UIColor {
        
        let _variation = self.allCoins[indexPath].variation
    
        if _variation > 0 {
            return UIColor.green
            
        } else if _variation < 0 {
            return UIColor.red
            
        } else {
            return UIColor.white
        }
    }
    
    public func returnSigla(indexPath: Int) -> String{
        let _sigla = self.allCoins[indexPath].sigla ?? nil
        guard let sigla = _sigla else { return ""}
        
        return sigla
    }
    public func returnCoin(indexPath: Int) -> String{
        let _name = self.allCoins[indexPath].name
        return _name
    }
    
    public func returnCompra(indexPath: Int) -> Double{
        return self.allCoins[indexPath].buy
    }
    
    public func returnVenda(indexPath: Int) -> Double{
        guard let venda = self.allCoins[indexPath].sell else { return 0}
        return venda
    }

    
}
