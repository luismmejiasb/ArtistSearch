import Foundation

public enum FilteringType: String {
    case artist = "artistTerm"

    static let allFilters: [String]! = ["Artist Name"]

    public var filteringTypeURL: String {
        switch self {
        case .artist:
            return Constants.baseUrl + Constants.attributeUrl + FilteringType.artist.rawValue + Constants.endUrl
        }
    }
}
