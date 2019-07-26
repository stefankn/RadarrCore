//
//  RCLookupMovie.swift
//  
//
//  Created by Stefan Klein Nulent on 20/07/2019.
//

import Foundation

public struct RCLookupMovie: RCRequest {
    
    // MARK: - Types
    
    public typealias Response = [RCSearchResult]
    
    
    
    // MARK: - Properties
    
    let term: String
    
    
    // MARK: RCRequest Properties
    
    public var endpoint: String { "api/movie/lookup" }
    
    
    
    // MARK: - Construction
    
    public init(term: String) {
        self.term = term
    }
}
