//
//  ProjetoInvestimentoTests.swift
//  ProjetoInvestimentoTests
//
//  Created by user on 10/11/22.
//

import XCTest
@testable import ProjetoInvestimento

final class ProjetoInvestimentoTests: XCTestCase {

    var aplication: Wallet?
    
    override func setUpWithError() throws {
        aplication = Wallet()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConvert(){
        
        guard let result = aplication?.convert(value: 3.0) else { return}
        XCTAssertEqual(result, "R$ 3,00")
    }
    
    func testSell(){
        
        guard let sell = aplication?.sell(quantity: 3, valueSell: 3.0, sigla: "USD") else { return }
        XCTAssertEqual(sell, "R$ 709,00")
        
    }
}
