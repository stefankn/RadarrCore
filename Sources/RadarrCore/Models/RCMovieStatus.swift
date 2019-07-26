//
//  RCMovieStatus.swift
//  
//
//  Created by Stefan Klein Nulent on 19/07/2019.
//

import UIKit

public enum RCMovieStatus: String, Decodable {
    case announced = "announced"
    case inCinemas = "inCinemas"
    case released = "released"
    case tba = "tba"
    case unknown = "unknown"
    
    
    
    // MARK: - Properties
    
    public var statusDescription: String {
        switch self {
        case .announced:
            return NSLocalizedString("Announced", comment: "")
        case .inCinemas:
            return NSLocalizedString("In cinemas", comment: "")
        case .released:
            return NSLocalizedString("Released", comment: "")
        case .tba:
            return NSLocalizedString("To be announced", comment: "")
        case .unknown:
            return NSLocalizedString("Unknown", comment: "")
        }
    }
}
