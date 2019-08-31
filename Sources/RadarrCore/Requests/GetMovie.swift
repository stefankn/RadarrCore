//
//  GetMovie.swift
//  
//
//  Created by Stefan Klein Nulent on 26/07/2019.
//

import Foundation

public struct GetMovie: Request {
    
    // MARK: - Types
    
    public typealias Response = Movie
    
    
    
    // MARK: - Properties
    
    let id: Int
    
    
    // MARK: Request Properties
    
    public var endpoint: String { "api/movie/\(id)" }
    
    
    
    // MARK: - Construction
        
    public init(id: Int) {
        self.id = id
    }
}
