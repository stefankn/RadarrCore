//
//  RCGetProfiles.swift
//  
//
//  Created by Stefan Klein Nulent on 19/07/2019.
//

import Foundation

public struct RCGetProfiles: RCRequest {
    
    // MARK: - Types
    
    public typealias Response = [RCProfile]
    
    
    
    // MARK: - Properties
    
    // MARK: RCRequest Properties
    
    public var endpoint: String { "api/profile" }
    
    
    
    // MARK: - Construction
    
    public init() {}
}
