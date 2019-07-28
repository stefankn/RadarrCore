//
//  RCSendCommand.swift
//  
//
//  Created by Stefan Klein Nulent on 28/07/2019.
//

import Foundation

protocol RCSendCommand: RCRequest where Response == RCCommand {
    
    // MARK: - Properties
    
    var name: RCCommandName { get set }
}

extension RCSendCommand {
    
    // MARK: - Properties
    
    // MARK: RCRequest Properties
    
    public var endpoint: String { "api/command" }
    public var httpMethod: RCHTTPMethod { .post }
}
