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
    
    public func request() {
        self.service.getExchange { [weak self] result in
            
            switch result {
                
            case .success(let object):
                self?.success(object: object.results)
            case .failure(let error):
                self?.failure(error: error)
            }
        }
    }
    
    private func success(object: Results) {
        print("O objeto está sendo retornado")
        let object = object
        
        let moedas = [object.currencies.ARS, object.currencies.USD, object.currencies.EUR, object.currencies.AUD, object.currencies.GBP, object.currencies.CAD, object.currencies.JPY, object.currencies.BTC, object.currencies.CNY ]
        
        self.allCoins = moedas
        self.delegate?.success()
    }
    
    private func failure(error: Error){
        Logger.log("Não foi possível carregar o objeto")
        self.delegate?.error(mensage: error.localizedDescription)
    }
    
    
    public func returnCount() -> Int{
        return self.allCoins.count
    }
    
    public func returnSigla(indexPath: Int) -> String{
        
        let siglas = ["ARS", "USD", "EUR", "AUD", "GBP", "CAD", "JPY", "BTC", "CNY"]
        
        return siglas[indexPath]
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
