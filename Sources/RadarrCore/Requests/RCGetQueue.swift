//
//  RCGetQueue.swift
//  
//
//  Created by Stefan Klein Nulent on 23/08/2019.
//

import Foundation

public struct RCGetQueue: RCRequest {

    // MARK: - Types
    
    public typealias Response = [RCQueueItem]
    
    
    
    // MARK: - Properties
    
    // MARK: RCRequest Properties
    
    public var endpoint: String { "api/queue" }
    
    
    
    // MARK: - Construction
    
    public init() {}
}
