import Foundation
import UIKit

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
    
    public var informationIcon: UIImage {
        switch self {
        case .defaultInformation:
            return #imageLiteral(resourceName: "artistSearchIcon")
        case .noResults:
            return #imageLiteral(resourceName: "failedSearchIcon")
        }
    }
}
