//
//  ExchangeProfile.swift
//  ProjetoInvestimento
//
//  Created by user on 16/10/22.
//

import Foundation

struct ExchangeGroup: Codable {
    var results: Results
    var validKey: Bool
    
    enum CodingKeys: String, CodingKey {
           case validKey = "valid_key"
           case results
    }
}

struct Results: Codable {
    var currencies: Currencies
    var availableSources: [String]

    enum CodingKeys: String, CodingKey {
        case currencies
        case availableSources = "available_sources"
    }
    
}

struct Currencies: Codable {
    var source: String
    var USD, EUR, GBP, ARS, CAD, AUD, JPY, CNY, BTC: Coins
    
//    enum CodingKeys: String, CodingKey {
//        
//        case source
//        case USD = "USD"
//        case EUR = "EUR"
//        case GBP = "GBP"
//        case ARS = "ARS"
//        case CAD = "CAD"
//        case AUD = "AUD"
//        case JPY = "JPY"
//        case CNY = "CNY"
//        case BTC = "BTC"
//        
//    }
}

struct Coins: Codable{
    let name: String
    let buy: Double
    let sell: Double?
    let variation: Double
    var sigla: String?
}
