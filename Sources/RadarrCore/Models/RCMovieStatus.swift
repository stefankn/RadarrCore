//
//  RCMovieStatus.swift
//  
//
//  Created by Stefan Klein Nulent on 19/07/2019.
//

import Foundation

public enum RCMovieStatus: String, Decodable {
    case announced = "announced"
    case inCinemas = "inCinemas"
    case released = "released"
    case tba = "tba"
    case unknown = "unknown"
}
