//
//  RCCalendarDate.swift
//  
//
//  Created by Stefan Klein Nulent on 02/08/2019.
//

import Foundation


public struct RCCalendarDate: Hashable, Comparable {
    
    // MARK: - Properties
    
    public let date: Date
    public let movies: [RCMovie]
    public let isInCurrentMonth: Bool
    
    public var dayNumber: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
    
    
    
    // MARK: - Construction
    
    public init(date: Date, movies: [RCMovie] = [], isInCurrentMonth: Bool = true) {
        self.date = date
        self.movies = movies
        self.isInCurrentMonth = isInCurrentMonth
    }
    
    
    
    // MARK: - Functions
    
    // MARK: Equatable Functions

    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.date == rhs.date
    }

    
    // MARK: Comparable Functions
    
    public static func < (lhs: RCCalendarDate, rhs: RCCalendarDate) -> Bool {
        return lhs.date < rhs.date
    }
    
    
    // MARK: Hashable Functions
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(date)
    }
}
