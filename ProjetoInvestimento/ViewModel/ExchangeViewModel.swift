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
            
            if var success = success {
                print("O obejto está sendo retornado")
                
                success.results.currencies.ARS.sigla = "ARS"
                success.results.currencies.USD.sigla = "USD"
                success.results.currencies.EUR.sigla = "EUR"
                success.results.currencies.AUD.sigla = "AUD"
                success.results.currencies.GBP.sigla = "GBP"
                success.results.currencies.CAD.sigla = "CAD"
                success.results.currencies.JPY.sigla = "JPY"
                success.results.currencies.BTC.sigla = "BTC"
                success.results.currencies.CNY.sigla = "CNY"
                
                self.allCoins.append(success.results.currencies.USD)
                self.allCoins.append(success.results.currencies.EUR)
                self.allCoins.append(success.results.currencies.ARS)
                self.allCoins.append(success.results.currencies.AUD)
                self.allCoins.append(success.results.currencies.GBP)
                self.allCoins.append(success.results.currencies.CAD)
                self.allCoins.append(success.results.currencies.JPY)
                self.allCoins.append(success.results.currencies.BTC)
                self.allCoins.append(success.results.currencies.CNY)
                
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
        let variation = String(self.allCoins[indexPath].variation)
        return "\(variation)%"
    }
    
    public func returnVariationColor(indexPath: Int) -> UIColor {
        
        let variation = self.allCoins[indexPath].variation
    
        if variation > 0 {
            return UIColor.green
            
        } else if variation < 0 {
            return UIColor.red
            
        } else {
            return UIColor.white
        }
    }
    
    public func returnSigla(indexPath: Int) -> String{
        let sigla = self.allCoins[indexPath].sigla ?? nil
        guard let sigla = sigla else { return ""}
        
        return sigla
    }
    public func returnCoin(indexPath: Int) -> String{
        let name = self.allCoins[indexPath].name
        return name
    }
    
    public func returnCompra(indexPath: Int) -> Double{
        return self.allCoins[indexPath].buy
    }
    
    public func returnVenda(indexPath: Int) -> Double{
        guard let venda = self.allCoins[indexPath].sell else { return 0}
        return venda
    }   
}
