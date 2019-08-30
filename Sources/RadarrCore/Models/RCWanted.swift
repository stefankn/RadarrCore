//
//  RCWanted.swift
//  
//
//  Created by Stefan Klein Nulent on 28/07/2019.
//

import Foundation

public struct RCWanted: Decodable {
    
    // MARK: - Properties
    
    public let page: Int
    public let pageSize: Int
    public let records: [RCMovie]
}
