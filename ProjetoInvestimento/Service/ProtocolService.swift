//
//  Generic.swift
//  ProjetoInvestimento
//
//  Created by user on 16/10/22.
//

import Foundation

protocol GenericService: AnyObject{
    typealias completion <T> = (_ result: T,_ failure: Error?) -> Void
}

protocol ExchangeServiceDelegate: GenericService{
    func getExchangeFromAPI(completion: @escaping completion<ExchangeGroup?>)
}

enum Error: Swift.Error {
    
    case fileNotFound(name: String)
    case fileDecondingFailed(name:String, Swift.Error)
}
