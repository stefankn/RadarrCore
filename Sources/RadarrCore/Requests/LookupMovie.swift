//
//  LookupMovie.swift
//  
//
//  Created by Stefan Klein Nulent on 20/07/2019.
//

import Foundation

public struct LookupMovie: Request {
    
    // MARK: - Types
    
    public typealias Response = [SearchResult]
    
    
    
    // MARK: - Properties
    
    let term: String
    
    
    // MARK: Request Properties
    
    public var endpoint: String { "api/movie/lookup" }
    
    
    
    // MARK: - Construction
    
    public init(term: String) {
        self.term = term
    }
}
