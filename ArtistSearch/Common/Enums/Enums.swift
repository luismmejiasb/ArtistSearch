//
//  Enums.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import Foundation
import UIKit

public enum FilteringType: String {
    case artist = "artistTerm"
    
    static let all: [String]! = ["Artist Name"]
    
    public var filteringTypeURL: String {
        switch self {
        case .artist:
            return Constants.BASE_URL + Constants.ATTRIBUTE_URL + FilteringType.artist.rawValue + Constants.END_URL
        }
    }
}

public enum InformationType: Int {
    case defaultInformation
    case noResults
    
    public var informationMessage: String {
        switch self {
        case .defaultInformation:
            return NSLocalizedString("search_artist_default_information", comment: "")
        case .noResults:
            return NSLocalizedString("search_artist_nothing_found_information", comment: "")
        }
    }
    
    public var informationIcon: UIImage{
        switch self {
        case .defaultInformation:
            return #imageLiteral(resourceName: "artistSearchIcon")
        case .noResults:
            return #imageLiteral(resourceName: "failedSearchIcon")
        }
    }
}
