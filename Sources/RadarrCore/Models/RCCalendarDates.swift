//
//  RCCalendarDates.swift
//  
//
//  Created by Stefan Klein Nulent on 02/08/2019.
//

import Foundation

public struct RCCalendarDates: Decodable {
    
    // MARK: - Properties
    
    public let dates: [RCCalendarDate]
    
    
    
    // MARK: - Construction
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        var moviesInCalendar: [Date: [RCMovie]] = [:]
        
        if let movies = try? container.decode([RCMovie].self) {
            
            movies.forEach { movie in
                if let cinemaDate = movie.dateInCinemas {
                    if !moviesInCalendar.keys.contains(cinemaDate) {
                        moviesInCalendar[cinemaDate] = []
                    }
                    
                    moviesInCalendar[cinemaDate]?.append(movie)
                }
                
                if let physicalDate = movie.physicalReleaseDate {
                    if !moviesInCalendar.keys.contains(physicalDate) {
                        moviesInCalendar[physicalDate] = []
                    }
                    
                    moviesInCalendar[physicalDate]?.append(movie)
                }
            }
        }
        
        dates = moviesInCalendar.map{ RCCalendarDate(date: $0.0, movies: $0.1) }
    }
}
