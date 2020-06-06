//
//  HTTPParameter.swift
//  
//
//  Created by Stefan Klein Nulent on 20/07/2019.
//

import Foundation

enum HTTPParameter: Decodable, CustomStringConvertible {
    case string(String)
    case int(Int)
    case bool(Bool)
 
    
    
    // MARK: - Properties
    
    // MARK: CustomStringConvertible Properties
    
    var description: String {
        switch self {
        case .string(let string):
            return string
        case .int(let integer):
            return String(describing: integer)
        case .bool(let bool):
            return bool ? "true" : "false"
        }
    }
    
    
    
    // MARK: - Construction
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let string = try? container.decode(String.self) {
            self = .string(string)
        } else if let int = try? container.decode(Int.self) {
            self = .int(int)
        } else if let bool = try? container.decode(Bool.self) {
            self = .bool(bool)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Error decoding query parameter"
            )
        }
    }
}
