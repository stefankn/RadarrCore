//
//  RCDeleteMovie.swift
//  
//
//  Created by Stefan Klein Nulent on 27/07/2019.
//

import Foundation

public struct RCDeleteMovie: RCRequest {
    
    // MARK: - Types
    
    public typealias Response = [String: String]
    
    
    
    // MARK: - Properties
    
    let id: Int
    
    
    // MARK: RCRequest Properties
    
    public var endpoint: String { "api/movie/\(id)" }
    public var httpMethod: RCHTTPMethod { .delete }
    
    
    
    // MARK: - Construction
    
    public init(id: Int) {
        self.id = id
    }
}
