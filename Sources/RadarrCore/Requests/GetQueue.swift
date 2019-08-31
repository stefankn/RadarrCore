//
//  GetQueue.swift
//  
//
//  Created by Stefan Klein Nulent on 23/08/2019.
//

import Foundation

public struct GetQueue: Request {

    // MARK: - Types
    
    public typealias Response = [QueueItem]
    
    
    
    // MARK: - Properties
    
    // MARK: Request Properties
    
    public var endpoint: String { "api/queue" }
    
    
    
    // MARK: - Construction
    
    public init() {}
}
