//
//  Artist.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import Foundation
import RealmSwift

struct Artist {
    
    var artistId: Int = 0
    var primaryGenreName: String = ""
    var wrapperType: String = ""
    var artistName: String = ""
    var artistType: String = ""
    var artistLinkUrl: String = ""
    var primaryGenreId: Int = 0
    
    init(artistId: Int, primaryGenreName: String, wrapperType: String, artistName: String, artistType: String, artistLinkUrl: String, primaryGenreId: Int) {
        self.artistId = artistId
        self.primaryGenreName = primaryGenreName
        self.wrapperType = wrapperType
        self.artistName = artistName
        self.artistType = artistType
        self.artistLinkUrl = artistLinkUrl
        self.primaryGenreId = primaryGenreId
    }
}

class ArtistObject: Object {
    
    @objc dynamic var artistId: Int = 0
    @objc dynamic var primaryGenreName: String = ""
    @objc dynamic var wrapperType: String = ""
    @objc dynamic var artistName: String = ""
    @objc dynamic var artistType: String = ""
    @objc dynamic var artistLinkUrl: String = ""
    @objc dynamic var primaryGenreId: Int = 0
    
    override static func primaryKey() -> String? {
        return "artistId"
    }
    
}

extension Artist: Decodable {
    
    enum MyStructKeys: String, CodingKey {
        // swiftlint:disable redundant_string_enum_value
        case artistId = "artistId"
        case primaryGenreName = "primaryGenreName"
        case wrapperType = "wrapperType"
        case artistName = "artistName"
        case artistType = "artistType"
        case artistLinkUrl = "artistLinkUrl"
        case primaryGenreId = "primaryGenreId"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: MyStructKeys.self)
        
        let artistId: Int = try container.decodeIfPresent(Int.self, forKey: .artistId) ?? 0
        
        let primaryGenreName: String = try container.decodeIfPresent(String.self, forKey: .primaryGenreName) ?? "No information"
        
        let wrapperType: String = try container.decodeIfPresent(String.self, forKey: .wrapperType) ?? "No information"
        
        let artistName: String = try container.decodeIfPresent(String.self, forKey: .artistName) ?? "No information"
        
        let artistType: String = try container.decodeIfPresent(String.self, forKey: .artistType) ?? "No information"
        
        let artistLinkUrl: String = try container.decodeIfPresent(String.self, forKey: .artistLinkUrl) ?? "No information"
        
        let primaryGenreId: Int = try container.decodeIfPresent(Int.self, forKey: .primaryGenreId) ?? 0
        
        self.init(artistId: artistId, 
                  primaryGenreName: primaryGenreName, 
                  wrapperType: wrapperType, 
                  artistName: artistName, 
                  artistType: artistType, 
                  artistLinkUrl: artistLinkUrl, 
                  primaryGenreId: primaryGenreId)
    }
}
