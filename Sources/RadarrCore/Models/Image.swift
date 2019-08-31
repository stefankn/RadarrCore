//
//  Image.swift
//  
//
//  Created by Stefan Klein Nulent on 13/07/2019.
//

import Foundation

public struct Image: Codable, Hashable {
    
    // MARK: - Properties
    
    let coverType: ImageType?
    let url: String
}
