//
//  RCSearchMovies.swift
//  
//
//  Created by Stefan Klein Nulent on 28/07/2019.
//

import Foundation

public struct RCSearchMovies: RCSendCommand {

    // MARK: - Properties
    
    let movieIds: [Int]
    
    
    // MARK: RCSendCommand Properties
    
    public var name: RCCommandName = .moviesSearch
    
    
    
    // MARK: - Construction
    
    public init(movieIds: [Int]) {
        self.movieIds = movieIds
    }
}
