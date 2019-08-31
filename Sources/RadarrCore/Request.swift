//
//  Request.swift
//  
//
//  Created by Stefan Klein Nulent on 12/07/2019.
//

import Foundation

public protocol Request: Encodable {
    
    // MARK: - Types
    
    associatedtype Response: Decodable
    
    
    
    // MARK: - Properties
    
    var endpoint: String { get }
    var httpMethod: HTTPMethod { get }
}

extension Request {
    
    // MARK: - Properties
    
    public var httpMethod: HTTPMethod {
        return .get
    }
}
