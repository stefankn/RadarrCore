//
//  HistoryItem.swift
//  
//
//  Created by Stefan Klein Nulent on 23/08/2019.
//

import Foundation

public struct HistoryItem: Decodable, Hashable {
    
    // MARK: - Types
    
    private enum CodingKeys: String, CodingKey {
        case movie
        case sourceTitle
        case date
        case quality
    }
    
    private enum QualityKeys: String, CodingKey {
        case quality
    }
    
    
    
    // MARK: - Properties
    
    public let movie: Movie
    public let sourceTitle: String
    public let rawDate: String
    public let profile: Profile
    
    public var date: Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate, .withFullTime, .withFractionalSeconds]
        return formatter.date(from: rawDate)
    }
    
    
    
    // MARK: - Construction
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        movie = try values.decode(Movie.self, forKey: .movie)
        sourceTitle = try values.decode(String.self, forKey: .sourceTitle)
        rawDate = try values.decode(String.self, forKey: .date)
        
        let quality = try values.nestedContainer(keyedBy: QualityKeys.self, forKey: .quality)
        profile = try quality.decode(Profile.self, forKey: .quality)
    }
}
