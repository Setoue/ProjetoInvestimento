//
//  ExchangeProfileService.swift
//  ProjetoInvestimento
//
//  Created by user on 16/10/22.
//

import Foundation
import Alamofire

class ExchangeProfileService: ExchangeServiceDelegate{
    
    func getExchangeFromAPI(completion: @escaping completion<ExchangeGroup?>) {
        
        let url: String = "https://api.hgbrasil.com/finance"
        
        AF.request(url, method: .get).validate().responseDecodable(of: ExchangeGroup.self) { response in
            
            switch response.result{
            case .success(let success):
                print("SUCCESS -> \(#function)")
                completion(success, nil)
                
            case .failure(_):
                print("ERROR -> \(#function)")
                
            }
        }
    }
}
