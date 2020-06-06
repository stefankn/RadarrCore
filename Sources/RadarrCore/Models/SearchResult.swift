//
//  SearchResult.swift
//  
//
//  Created by Stefan Klein Nulent on 20/07/2019.
//

import Foundation

public struct SearchResult: Decodable, Hashable {

    // MARK: - Properties
    
    public let tmdbId: Int
    public let title: String
    public let year: Int
    public let overview: String?
    public let status: MovieStatus?
    public let downloaded: Bool
    public let isAvailable: Bool

    public var poster: String? { imagePath(for: .poster) }
    
    let titleSlug: String
    let images: [Image]
    
    
    
    // MARK: - Private Functions
        
    private func imagePath(for type: ImageType) -> String? {
        return images.filter({ $0.coverType == type }).first?.url
    }
}
