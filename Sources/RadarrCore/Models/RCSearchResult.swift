//
//  RCSearchResult.swift
//  
//
//  Created by Stefan Klein Nulent on 20/07/2019.
//

import Foundation

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
    
    
    
    // MARK: - Private Functions
        
    private func imagePath(for type: RCImageType) -> String? {
        return images.filter({ $0.coverType == type }).first?.url
    }
}
