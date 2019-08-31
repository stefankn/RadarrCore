//
//  CalendarDates.swift
//  
//
//  Created by Stefan Klein Nulent on 02/08/2019.
//

import Foundation

public struct CalendarDates: Decodable {
    
    // MARK: - Properties
    
    public let dates: [CalendarDate]
    
    
    
    // MARK: - Construction
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        var moviesInCalendar: [Date: [Movie]] = [:]
        
        if let movies = try? container.decode([Movie].self) {
            
            movies.forEach { movie in
                
                if let cinemaDate = movie.dateInCinemas {
                    let dateKey = Foundation.Calendar.current.startOfDay(for: cinemaDate)
                    if !moviesInCalendar.keys.contains(dateKey) {
                        moviesInCalendar[dateKey] = []
                    }
                    
                    moviesInCalendar[dateKey]?.append(movie)
                }
                
                if let physicalDate = movie.physicalReleaseDate {
                    let dateKey = Foundation.Calendar.current.startOfDay(for: physicalDate)
                    if !moviesInCalendar.keys.contains(dateKey) {
                        moviesInCalendar[dateKey] = []
                    }
                    
                    moviesInCalendar[dateKey]?.append(movie)
                }
            }
        }
        
        dates = moviesInCalendar.map{ CalendarDate(date: $0.0, movies: $0.1) }
    }
}
