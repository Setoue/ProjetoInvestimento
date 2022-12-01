//
//  ProjetoInvestimentoTestes.swift
//  ProjetoInvestimentoTestes
//
//  Created by user on 01/12/22.
//

import XCTest
@testable import ProjetoInvestimento

final class ProjetoInvestimentoTestes: XCTestCase {

    var requestUnderTest: URLSession!
    
    override func setUpWithError() throws {
        requestUnderTest = URLSession.shared
    }

    override func tearDownWithError() throws {
        requestUnderTest = nil
    }

    func testRequestStatusCodeAlamofire() {
        
        let url: String = "https://api.hgbrasil.com/finance"
        let promise = expectation(description: "Status code: 200")
        let dataTask = requestUnderTest.dataTask(with: URL(string: url)!) { data, response, error in
            
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code \(statusCode)")
                }
            }
        }
        dataTask.resume()
        
        waitForExpectations(timeout: 5)
    }

}
