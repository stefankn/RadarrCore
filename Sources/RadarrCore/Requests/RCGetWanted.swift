//
//  RCGetWanted.swift
//  
//
//  Created by Stefan Klein Nulent on 27/07/2019.
//

import Foundation

public struct RCGetWanted: RCRequest {
    
    // MARK: - Types
    
    public typealias Response = [RCMovie]
    
    
    
    // MARK: - Properties
    
    let page: Int
    let pageSize: Int
    
    
    // MARK: RCRequest Properties
    
    public var endpoint: String { "api/wanted/missing" }
}
