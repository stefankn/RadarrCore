//
//  RCGetMovies.swift
//  
//
//  Created by Stefan Klein Nulent on 13/07/2019.
//

import Foundation

public struct RCGetMovies: RCRequest {
    
    // MARK: - Types
    
    public typealias Response = [RCMovie]
    
    
    
    // MARK: - Properties
    
    // MARK: RCRequest Properties
    
    public var endpoint: String { "api/movie" }
    
    
    
    // MARK: - Construction
    
    public init() {}
}
