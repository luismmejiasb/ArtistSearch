//
//  ArtistSearchMockInteractor.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 8/30/19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import Foundation

class ArtistSearchMockInteractor: ArtistSearchInteractorInterface {
    func searchTerm(withFilteringType _: FilteringType, and _: String, completion: @escaping ([Artist], Int) -> Void) {
        completion([Artist(artistId: 1, primaryGenreName: "Something", wrapperType: "Shomething", artistName: "Someone", artistType: "Some Type", artistLinkUrl: "Some URL", primaryGenreId: 2)], 200)
    }

    func cancelAPIRequest() {}
}
