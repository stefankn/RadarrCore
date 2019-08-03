//
//  RCGetCalendar.swift
//  
//
//  Created by Stefan Klein Nulent on 02/08/2019.
//

import Foundation

public struct RCGetCalendar: RCRequest {
    
    // MARK: - Types

    public typealias Response = RCCalendarDates
    
    
    
    // MARK: - Properties
    
    public let start: Date
    public let end: Date
    
    
    // MARK: RCRequest Properties
    
    public var endpoint: String { "api/calendar" }
    
    
    
    // MARK: - Construction
    
    public init(startDate: Date, endDate: Date) {
        start = startDate
        end = endDate
    }
}
