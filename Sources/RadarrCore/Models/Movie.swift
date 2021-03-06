//
//  Movie.swift
//  
//
//  Created by Stefan Klein Nulent on 13/07/2019.
//

import Foundation

public struct Movie: Decodable, Hashable, Equatable, CustomStringConvertible {

    // MARK: - Properties

    public let id: Int
    public let imdbId: String?
    public let title: String
    public let titleSlug: String
    public let sortTitle: String
    public let overview: String?
    public let year: Int
    public let status: MovieStatus?
    public let downloaded: Bool
    public let isAvailable: Bool?
    public let hasFile: Bool
    public let qualityProfileId: Int
    public let tmdbId: Int
    public let images: [Image]
    public let added: String
    public let youTubeTrailerId: String?
    public let physicalRelease: String?
    public let inCinemas: String?

    public var poster: String? { imagePath(for: .poster) }
    public var fanart: String? { imagePath(for: .fanart) }
    
    public var isPending: Bool {
        return status == .tba
    }
 
    public var imdbURL: URL? {
        if let imdbId = imdbId {
            return URL(string: "https://www.imdb.com/title/\(imdbId)")
        } else {
            return nil
        }
    }
    
    public var trailer: String? {
        if let trailerId = youTubeTrailerId {
            return "https://www.youtube.com/watch?v=\(trailerId)"
        }
        
        return nil
    }
    
    public var trailerURL: URL? {
        if let trailer = trailer {
            return URL(string: trailer)
        } else {
            return nil
        }
    }
    
    public var youtubeURL: URL? {
        if let trailerId = youTubeTrailerId {
            return URL(string: "youtube://\(trailerId)")
        } else {
            return nil
        }
    }
    
    public var addedDate: Date {
        return formatDate(from: added, options: [.withFullDate, .withFullTime, .withFractionalSeconds]) ?? Date()
    }
    
    public var dateInCinemas: Date? {
        return formatDate(from: inCinemas)
    }
    
    public var physicalReleaseDate: Date? {
        return formatDate(from: physicalRelease)
    }
    
    
    // MARK: CustomStringConvertible Properties
    
    public var description: String {
        return title
    }
    
    
    
    // MARK: - Functions
    
    // MARK: Equatable Functions
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    
    // MARK: - Private Functions
    
    private func imagePath(for type: ImageType) -> String? {
        return images.filter({ $0.coverType == type }).first?.url
    }
    
    private func formatDate(from string: String?, options: ISO8601DateFormatter.Options = [.withFullDate, .withFullTime]) -> Date? {
        guard let string = string else { return nil }
        
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = options
        return formatter.date(from: string)
    }
}
