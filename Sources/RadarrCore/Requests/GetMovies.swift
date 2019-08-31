//
//  GetMovies.swift
//  
//
//  Created by Stefan Klein Nulent on 13/07/2019.
//

import Foundation

public struct GetMovies: Request {
    
    // MARK: - Types
    
    public typealias Response = [Movie]
    
    
    
    // MARK: - Properties
    
    // MARK: Request Properties
    
    public var endpoint: String { "api/movie" }
    
    
    
    // MARK: - Construction
    
    public init() {}
}
