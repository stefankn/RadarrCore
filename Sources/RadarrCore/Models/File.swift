//
//  RCQueueItemStatus.swift
//  
//
//  Created by Stefan Klein Nulent on 30/08/2019.
//

import Foundation

public enum RCQueueItemStatus: String, Decodable {
    case downloading = "Downloading"
    case paused = "Paused"
}
