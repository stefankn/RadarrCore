//
//  File.swift
//  
//
//  Created by Stefan Klein Nulent on 13/07/2019.
//

import UIKit

public struct RCMovie: Decodable, Hashable, Equatable, CustomStringConvertible {

    // MARK: - Properties

    public let id: Int
    public let imdbId: String?
    public let title: String
    public let titleSlug: String
    public let sortTitle: String
    public let overview: String?
    public let year: Int
    public let status: RCMovieStatus?
    public let downloaded: Bool
    public let isAvailable: Bool?
    public let qualityProfileId: Int
    public let tmdbId: Int
    public let images: [RCImage]
    public let added: String

    public var poster: URL? { imageURL(for: .poster) }
    public var fanart: URL? { imageURL(for: .fanart) }
    
    public var isPending: Bool {
        return status == .tba
    }
    
    public var statusDescription: String? {
        if downloaded {
            return NSLocalizedString("Downloaded", comment: "Downloaded")
        } else if isAvailable == true {
            return NSLocalizedString("Missing", comment: "Missing")
        } else {
            return status?.statusDescription
        }
    }
    
    public var statusColor: UIColor {
        if downloaded {
            return UIColor(red: 0.106, green: 0.639, blue: 0.188, alpha: 1.0)
        } else if isAvailable == true {
            return UIColor(red: 0.616, green: 0.0, blue: 0.008, alpha: 1.0)
        } else {
            return UIColor(red: 0.071, green: 0.427, blue: 0.757, alpha: 1.0)
        }
    }
    
    public var profile: RCProfile? {
        return RCManager.shared.profile(for: qualityProfileId)
    }
    
    public var imdbURL: URL? {
        if let imdbId = imdbId {
            return URL(string: "https://www.imdb.com/title/\(imdbId)")
        } else {
            return nil
        }
    }
    
    public var addedDate: Date {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullTime, .withFullDate, .withFractionalSeconds]
        return formatter.date(from: added) ?? Date()
    }
    
    
    // MARK: CustomStringConvertibleProperties
    
    public var description: String {
        return title
    }
    
    
    
    // MARK: - Functions
    
    public func delete(completion: @escaping (Result<[String: String], Error>) -> Void) {
        RCService(server: RCManager.shared.server.value)?.send(RCDeleteMovie(id: id), completion: completion)
    }
    
    
    // MARK: Equatable Functions
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    
    // MARK: - Private Functions
    
    private func imageURL(for type: RCImageType) -> URL? {
        if
            let server = RCManager.shared.server.value,
            let image = images.filter({ $0.coverType == type }).first {
            
            return URL(string: image.url, relativeTo: server.url)
        } else {
            return nil
        }
    }
}
