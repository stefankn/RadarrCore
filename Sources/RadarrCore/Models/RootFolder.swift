//
//  RootFolder.swift
//  
//
//  Created by Stefan Klein Nulent on 26/07/2019.
//

import Foundation

public struct RootFolder: Decodable {
    
    // MARK: - Properties
    
    let id: Int
    let path: String
    let freeSpace: Int
    let totalSpace: Int
}
