//
//  ArtistSerachRouter.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 28-12-19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//
import UIKit

class ArtistSearchRouter: ArtistSearchRouterProtocol {
    var view: ArtistSearchViewController?

    func presentArtistDetail(_ artist: Artist) {
        let artistDetailController = ArtistDetailWireframe.assemble(withSelectedArtist: artist)
        view?.navigationController?.pushViewController(artistDetailController, animated: true)
    }
}
