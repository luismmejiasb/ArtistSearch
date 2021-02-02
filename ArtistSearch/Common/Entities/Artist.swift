//
//  Artist.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import Foundation
import RealmSwift

struct Artist: Codable {
    var artistId: Int
    var primaryGenreName: String
    var wrapperType: String
    var artistName: String
    var artistType: String
    var artistLinkUrl: String
    var primaryGenreId: Int
    
    init(){
        self.artistId =  0
        self.primaryGenreName = ""
        self.wrapperType = ""
        self.artistName = ""
        self.artistType = ""
        self.artistLinkUrl = ""
        self.primaryGenreId =  0
    }
    
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

    required init() {
        self.artistId =  0
        self.primaryGenreName = ""
        self.wrapperType = ""
        self.artistName = ""
        self.artistType = ""
        self.artistLinkUrl = ""
        self.primaryGenreId =  0
    }
}
