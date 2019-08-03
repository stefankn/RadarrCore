//
//  RCURLQueryItemEncoder.swift
//  
//
//  Created by Stefan Klein Nulent on 20/07/2019.
//

import Foundation

enum RCURLQueryItemEncoder {
    
    // MARK: - Functions
    
    static func encode<T: Encodable>(_ encodable: T) throws -> [URLQueryItem] {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let parametersData = try encoder.encode(encodable)
        let parameters = try JSONDecoder().decode([String: RCHTTPParameter].self, from: parametersData)
        return parameters.map{ URLQueryItem(name: $0.0, value: $0.1.description) }
    }
}
