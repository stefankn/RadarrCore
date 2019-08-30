//
//  RCImage.swift
//  
//
//  Created by Stefan Klein Nulent on 13/07/2019.
//

import Foundation

public struct RCImage: Codable, Hashable {
    
    // MARK: - Properties
    
    let coverType: RCImageType?
    let url: String
}
