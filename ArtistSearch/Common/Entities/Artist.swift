import Foundation
import RealmSwift

struct SearchResult: Codable {
    var resultCount: Int
    var results: [Artist]

    init() {
        resultCount = 0
        results = [Artist]()
    }
}

struct Artist: Codable {
    var artistId: Int
    var primaryGenreName: String
    var wrapperType: String
    var artistName: String
    var artistType: String
    var artistLinkUrl: String
    var primaryGenreId: Int

    init() {
        artistId = 0
        primaryGenreName = ""
        wrapperType = ""
        artistName = ""
        artistType = ""
        artistLinkUrl = ""
        primaryGenreId = 0
    }

    init(
        artistId: Int,
        primaryGenreName: String,
        wrapperType: String,
        artistName: String,
        artistType: String,
        artistLinkUrl: String,
        primaryGenreId: Int
    ) {
        self.artistId = artistId
        self.primaryGenreName = primaryGenreName
        self.wrapperType = wrapperType
        self.artistName = artistName
        self.artistType = artistType
        self.artistLinkUrl = artistLinkUrl
        self.primaryGenreId = primaryGenreId
    }

    init(artistObject: ArtistObject) {
        artistId = artistObject.artistId
        primaryGenreName = artistObject.primaryGenreName
        wrapperType = artistObject.wrapperType
        artistName = artistObject.artistName
        artistType = artistObject.artistType
        artistLinkUrl = artistObject.artistLinkUrl
        primaryGenreId = artistObject.primaryGenreId
    }
}

// MARK: - Realm

class ArtistObject: Object {
    @objc dynamic var artistId: Int
    @objc dynamic var primaryGenreName: String
    @objc dynamic var wrapperType: String
    @objc dynamic var artistName: String
    @objc dynamic var artistType: String
    @objc dynamic var artistLinkUrl: String
    @objc dynamic var primaryGenreId: Int

    override static func primaryKey() -> String? {
        return "artistId"
    }

    override required init() {
        artistId = 0
        primaryGenreName = ""
        wrapperType = ""
        artistName = ""
        artistType = ""
        artistLinkUrl = ""
        primaryGenreId = 0
    }
}
