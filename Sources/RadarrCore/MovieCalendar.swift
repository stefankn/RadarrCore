//
//  MovieCalendar.swift
//  
//
//  Created by Stefan Klein Nulent on 03/08/2019.
//

import Foundation

public final class MovieCalendar {
    
    // MARK: - Private Properties

    private var date: Date?
    private let calendar: Calendar
    
    
    
    // MARK: - Properties

    public var server: Server?
    
    public var startDate: Date? {
        return startOfMonth(for: date)
    }
    
    public var endDate: Date? {
        return endOfMonth(for: date)
    }
    
    public var inclusiveStartDate: Date? {
        if let startDate = startOfMonth(for: date) {

            let monthStartWeekDay = calendar.component(.weekday, from: startDate)
            let nofPreviousMonthDays = (7 + monthStartWeekDay - calendar.firstWeekday) % 7

            if nofPreviousMonthDays > 0 {
                return calendar.date(byAdding: .day, value: -nofPreviousMonthDays, to: startDate)
            } else {
                return startDate
            }
        }

        return nil
    }
    
    public var inclusiveEndDate: Date? {
        if let endDate = endOfMonth(for: date) {

            let monthEndWeekDay = calendar.component(.weekday, from: endDate)
            let nofNextMonthDays = (7 - (monthEndWeekDay - calendar.firstWeekday) - 1) % 7
            
            if nofNextMonthDays > 0 {
                return calendar.date(byAdding: .day, value: nofNextMonthDays, to: endDate)
            } else {
                return endDate
            }
        }
        
        return nil
    }
    
    
    
    // MARK: - Construction
    
    public init(initialDate: Date = Date(), calendar: Foundation.Calendar = .current) {
        self.date = initialDate
        self.calendar = calendar
    }
    
    
    
    // MARK: - Functions
    
    public func monthCalendar(completion: @escaping (Result<[CalendarDate], Error>) -> Void) {
        guard let server = server, let startDate = inclusiveStartDate, let endDate = inclusiveEndDate else { return }
        
        Service(server: server)?.send(GetCalendar(startDate: startDate, endDate: endDate)) { [weak self] result in
            switch result {
            case .success(let calendarDates):
                let dates = self?.generateCalendarMonth(for: calendarDates) ?? []
                completion(.success(dates))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func previousMonth() {
        date = previousMonth(for: date)
    }
    
    public func nextMonth() {
        date = nextMonth(for: date)
    }
    
    
    
    // MARK: - Private Functions
    
    private func generateCalendarMonth(for calendarDates: CalendarDates) -> [CalendarDate] {
        guard
            let startDate = startDate, let endDate = endDate,
            let inclusiveStartDate = inclusiveStartDate,
            let inclusiveEndDate = inclusiveEndDate else { return [] }
        
        var dates = Set(dateRange(from: inclusiveStartDate, to: inclusiveEndDate).map{
            CalendarDate(date: $0, isInCurrentMonth: (startDate...endDate).contains($0))
        })
        
        calendarDates.dates.filter{ dates.contains($0) }.forEach{
            dates.update(with: CalendarDate(date: $0.date, movies: $0.movies, isInCurrentMonth: (startDate...endDate).contains($0.date)))
        }

        return Array(dates).sorted()
    }
    
    private func dateRange(from fromDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var current = fromDate

        while current <= toDate {
            dates.append(current)
            guard let newDate = calendar.date(byAdding: .day, value: 1, to: current) else { break }
            current = newDate
        }
        
        return dates
    }
    
    private func startOfMonth(for date: Date?) -> Date? {
        guard let date = date else { return nil }
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)
    }
    
    private func endOfMonth(for date: Date?) -> Date? {
        guard let startOfMonth = startOfMonth(for: date) else { return nil }
        return calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)
    }
    
    private func nextMonth(for date: Date?) -> Date? {
        guard let date = date else { return nil }
        return calendar.date(byAdding: .month, value: 1, to: date)
    }

    private func previousMonth(for date: Date?) -> Date? {
        guard let date = date else { return nil }
        return calendar.date(byAdding: .month, value: -1, to: date)
    }
}
