//
//  ArtistDetailRouter.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 28-12-19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import Foundation

class ArtistDetailRouter: ArtistDetailRouterProtocol {
    var view: ArtistDetailViewController?

    func presentArtistDetail(_ artist: Artist) {
        let artistDetailController = ArtistDetailWireframe.assemble(withSelectedArtist: artist)
        view?.navigationController?.pushViewController(artistDetailController, animated: true)
    }
}
