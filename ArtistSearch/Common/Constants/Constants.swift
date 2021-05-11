import Foundation

public struct Constants {
    static let baseUrl: String = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
    static let attributeUrl : String = Bundle.main.object(forInfoDictionaryKey: "ATTRIBUTE_URL") as? String ?? ""
    static let endUrl: String = Bundle.main.object(forInfoDictionaryKey: "END_URL") as? String ?? ""
}
