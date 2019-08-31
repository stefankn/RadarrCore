//
//  GetHistory.swift
//  
//
//  Created by Stefan Klein Nulent on 23/08/2019.
//

import Foundation

public struct GetHistory: Request {

    // MARK: - Types
    
    public typealias Response = HistoryItems
    
    
    
    // MARK: - Properties
    
    let page: Int
    let pageSize: Int
    let filterValue = 3
    let filterKey = "eventType"
    
    
    // MARK: Request Properties
    
    public var endpoint: String { "api/history" }
    
    
    
    // MARK: - Construction
    
    public init(page: Int, pageSize: Int) {
        self.page = page
        self.pageSize = pageSize
    }
}
