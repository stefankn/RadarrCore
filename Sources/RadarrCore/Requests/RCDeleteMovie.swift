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
    let deleteFiles: Bool
    
    
    // MARK: RCRequest Properties
    
    public var endpoint: String { "api/movie/\(id)" }
    public var httpMethod: RCHTTPMethod { .delete }
    
    
    
    // MARK: - Construction
    
    public init(id: Int, deleteFiles: Bool) {
        self.id = id
        self.deleteFiles = deleteFiles
    }
}
