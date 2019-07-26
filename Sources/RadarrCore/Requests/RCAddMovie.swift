//
//  RCAddMovie.swift
//  
//
//  Created by Stefan Klein Nulent on 21/07/2019.
//

import Foundation

public struct RCAddMovie: RCRequest {
    
    // MARK: - Types
    
    public typealias Response = RCMovie
    
    
    
    // MARK: - Properties
    
    let title: String
    let titleSlug: String
    let qualityProfileId: Int
    let images: [RCImage]
    let tmdbId: Int
    let year: Int
    let rootFolderPath: String
    
    
    // MARK: RCRequest Properties
    
    public var endpoint: String { "api/movie" }
    public var httpMethod: RCHTTPMethod { .post }
    
    
    
    // MARK: - Construction
    
    public init(_ searchResult: RCSearchResult, profile: RCProfile, rootFolder: RCRootFolder) {
        self.title = searchResult.title
        self.titleSlug = searchResult.titleSlug
        self.qualityProfileId = profile.id
        self.images = searchResult.images
        self.tmdbId = searchResult.tmdbId
        self.year = searchResult.year
        self.rootFolderPath = rootFolder.path
    }
}
