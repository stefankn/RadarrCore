//
//  GetRootFolder.swift
//  
//
//  Created by Stefan Klein Nulent on 26/07/2019.
//

import Foundation

public struct GetRootFolder: Request {

    // MARK: - Types
    
    public typealias Response = [RootFolder]
    
    
    
    // MARK: - Properties
    
    // MARK: Request Properties
    
    public var endpoint: String { "api/rootfolder" }
    
    
    
    // MARK: - Construction
    
    public init() {}
}
