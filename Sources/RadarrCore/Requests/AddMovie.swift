//
//  AddMovie.swift
//  
//
//  Created by Stefan Klein Nulent on 21/07/2019.
//

import Foundation

public struct AddMovie: Request {
    
    // MARK: - Types
    
    public typealias Response = Movie
    
    
    
    // MARK: - Properties
    
    let title: String
    let titleSlug: String
    let qualityProfileId: Int
    let images: [Image]
    let tmdbId: Int
    let year: Int
    let rootFolderPath: String
    
    
    // MARK: Request Properties
    
    public var endpoint: String { "api/movie" }
    public var httpMethod: HTTPMethod { .post }
    
    
    
    // MARK: - Construction
    
    public init(_ searchResult: SearchResult, profile: Profile, rootFolder: RootFolder) {
        self.title = searchResult.title
        self.titleSlug = searchResult.titleSlug
        self.qualityProfileId = profile.id
        self.images = searchResult.images
        self.tmdbId = searchResult.tmdbId
        self.year = searchResult.year
        self.rootFolderPath = rootFolder.path
    }
}
