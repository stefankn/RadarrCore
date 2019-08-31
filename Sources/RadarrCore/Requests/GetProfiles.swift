//
//  GetProfiles.swift
//  
//
//  Created by Stefan Klein Nulent on 19/07/2019.
//

import Foundation

public struct GetProfiles: Request {
    
    // MARK: - Types
    
    public typealias Response = [Profile]
    
    
    
    // MARK: - Properties
    
    // MARK: Request Properties
    
    public var endpoint: String { "api/profile" }
    
    
    
    // MARK: - Construction
    
    public init() {}
}
