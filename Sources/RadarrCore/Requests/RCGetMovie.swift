//
//  RCGetMovie.swift
//  
//
//  Created by Stefan Klein Nulent on 26/07/2019.
//

import Foundation

public struct RCGetMovie: RCRequest {
    
    // MARK: - Types
    
    public typealias Response = RCMovie
    
    
    
    // MARK: - Properties
    
    let id: Int
    
    
    // MARK: RCRequest Properties
    
    public var endpoint: String { "api/movie/\(id)" }
    
    
    
    // MARK: - Construction
        
    public init(id: Int) {
        self.id = id
    }
}
