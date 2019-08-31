//
//  QueueItem.swift
//  
//
//  Created by Stefan Klein Nulent on 23/08/2019.
//

import Foundation

public struct QueueItem: Decodable, Hashable {
    
    // MARK: - Properties
    
    public let id: Int
    public let movie: Movie
    public let size: Int
    public let sizeleft: Int
    public let title: String
    public let timeleft: String?
    public let estimatedCompletionTime: String?
    public let status: QueueItemStatus
    
    public var progress: Float {
        return Float(size - sizeleft) / Float(size)
    }
}
