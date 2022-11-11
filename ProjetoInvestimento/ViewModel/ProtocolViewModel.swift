//
//  ProtocolViewModel.swift
//  ProjetoInvestimento
//
//  Created by user on 16/10/22.
//

import Foundation

protocol ExchangeViewModelDelegate: AnyObject {
    
    func success()
    func error(mensage: String)
}


