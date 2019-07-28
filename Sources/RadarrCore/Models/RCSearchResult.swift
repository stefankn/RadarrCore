//
//  RCSearchResult.swift
//  
//
//  Created by Stefan Klein Nulent on 20/07/2019.
//

import UIKit

public struct RCSearchResult: Decodable, Hashable {

    // MARK: - Properties
    
    let tmdbId: Int
    let titleSlug: String
    let images: [RCImage]
    public let title: String
    public let year: Int
    public let overview: String?
    public let status: RCMovieStatus?
    public let downloaded: Bool
    public let isAvailable: Bool
    
    public var poster: String? { imagePath(for: .poster) }
    
    public var statusDescription: String? {
        if downloaded {
            return NSLocalizedString("Downloaded", comment: "Downloaded")
        } else if isAvailable {
            return NSLocalizedString("Available", comment: "Available")
        } else {
            return status?.statusDescription
        }
    }
    
    public var statusColor: UIColor {
        if downloaded {
            return UIColor(red: 0.106, green: 0.639, blue: 0.188, alpha: 1.0)
        } else if isAvailable {
            return UIColor(red: 0.616, green: 0.0, blue: 0.008, alpha: 1.0)
        } else {
            return UIColor(red: 0.071, green: 0.427, blue: 0.757, alpha: 1.0)
        }
    }
    
    
    
    // MARK: - Private Functions
        
    private func imagePath(for type: RCImageType) -> String? {
        return images.filter({ $0.coverType == type }).first?.url
    }
}
