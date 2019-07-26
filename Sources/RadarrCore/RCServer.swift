//
//  RCServer.swift
//  
//
//  Created by Stefan Klein Nulent on 19/07/2019.
//

import Foundation


public struct RCServer: Codable {
    
    // MARK: - Properties
    
    public let host: String
    public let apikey: String
    
    public var url: URL? {
        var host = self.host.replacingOccurrences(of: "http://", with: "")
        if host.last == "/" {
            host.removeLast()
        }
        
        return URL(string: "http://\(host)/")
    }
}
