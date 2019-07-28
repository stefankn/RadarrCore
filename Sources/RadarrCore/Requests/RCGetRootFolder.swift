//
//  RCGetRootFolder.swift
//  
//
//  Created by Stefan Klein Nulent on 26/07/2019.
//

import Foundation

public struct RCGetRootFolder: RCRequest {

    // MARK: - Types
    
    public typealias Response = [RCRootFolder]
    
    
    
    // MARK: - Properties
    
    // MARK: RCRequest Properties
    
    public var endpoint: String { "api/rootfolder" }
    
    
    
    // MARK: - Construction
    
    public init() {}
}
