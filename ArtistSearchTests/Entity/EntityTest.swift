//
//  EntityTest.swift
//  ArtistSearchTests
//
//  Created by Luis Mejías on 5/22/19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import XCTest
@testable import ArtistSearch

class EntityTest: XCTestCase {

    func testArtistSetGet() {
        let artist = Artist.init(artistId: 2, 
                                 primaryGenreName: "Pop", 
                                 wrapperType: "Some", 
                                 artistName: "Someone", 
                                 artistType: "Something", 
                                 artistLinkUrl: "URL", 
                                 primaryGenreId: 1)
        XCTAssertEqual(artist.artistName, "Someone")
        XCTAssertEqual(artist.artistId, 2)
        XCTAssertEqual(artist.artistLinkUrl, "URL")
    }

}
