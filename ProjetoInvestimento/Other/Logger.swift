//
//  Logger.swift
//  ProjetoInvestimento
//
//  Created by user on 24/02/23.
//

import Foundation

class Logger {
    
    static func log(_ message: String, file: String = #file, line: Int = #line, function: String = #function) {
        print("Message: \(message)")
        print("File: \(file)")
        print("Line: \(line)")
        print("Function: \(function)")
    }
}
