//
//  RCHTTPParameter.swift
//  
//
//  Created by Stefan Klein Nulent on 20/07/2019.
//

import Foundation

enum RCHTTPParameter: Decodable, CustomStringConvertible {
    case string(String)
 
    
    
    // MARK: - Properties
    
    // MARK: CustomStringConvertible Properties
    
    var description: String {
        switch self {
        case .string(let string):
            return string
        }
    }
    
    
    
    // MARK: - Construction
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let string = try? container.decode(String.self) {
            self = .string(string)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Error decoding query parameter"
            )
        }
    }
}
