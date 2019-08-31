//
//  SendCommand.swift
//  
//
//  Created by Stefan Klein Nulent on 28/07/2019.
//

import Foundation

protocol SendCommand: Request where Response == Command {
    
    // MARK: - Properties
    
    var name: CommandName { get set }
}

extension SendCommand {
    
    // MARK: - Properties
    
    // MARK: Request Properties
    
    public var endpoint: String { "api/command" }
    public var httpMethod: HTTPMethod { .post }
}
