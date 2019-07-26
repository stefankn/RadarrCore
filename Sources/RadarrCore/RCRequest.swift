//
//  RCRequest.swift
//  
//
//  Created by Stefan Klein Nulent on 12/07/2019.
//

import Foundation

public protocol RCRequest: Encodable {
    associatedtype Response: Decodable
    
    var endpoint: String { get }
    var httpMethod: RCHTTPMethod { get }
}

extension RCRequest {
    public var httpMethod: RCHTTPMethod {
        return .get
    }
}
