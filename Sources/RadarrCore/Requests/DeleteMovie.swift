//
//  DeleteMovie.swift
//  
//
//  Created by Stefan Klein Nulent on 27/07/2019.
//

import Foundation

public struct DeleteMovie: Request {
    
    // MARK: - Types
    
    public typealias Response = [String: String]
    
    
    
    // MARK: - Properties
    
    let id: Int
    let deleteFiles: Bool
    
    
    // MARK: Request Properties
    
    public var endpoint: String { "api/movie/\(id)" }
    public var httpMethod: HTTPMethod { .delete }
    
    
    
    // MARK: - Construction
    
    public init(id: Int, deleteFiles: Bool) {
        self.id = id
        self.deleteFiles = deleteFiles
    }
}
