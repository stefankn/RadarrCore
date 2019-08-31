//
//  SearchMovies.swift
//  
//
//  Created by Stefan Klein Nulent on 28/07/2019.
//

import Foundation

public struct SearchMovies: SendCommand {

    // MARK: - Properties
    
    let movieIds: [Int]
    
    
    // MARK: SendCommand Properties
    
    public var name: CommandName = .moviesSearch
    
    
    
    // MARK: - Construction
    
    public init(movieIds: [Int]) {
        self.movieIds = movieIds
    }
}
