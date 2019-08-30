//
//  RCRequest.swift
//  
//
//  Created by Stefan Klein Nulent on 12/07/2019.
//

import Foundation

public protocol RCRequest: Encodable {
    
    // MARK: - Types
    
    associatedtype Response: Decodable
    
    
    
    // MARK: - Properties
    
    var endpoint: String { get }
    var httpMethod: RCHTTPMethod { get }
}

extension RCRequest {
    
    // MARK: - Properties
    
    public var httpMethod: RCHTTPMethod {
        return .get
    }
}
