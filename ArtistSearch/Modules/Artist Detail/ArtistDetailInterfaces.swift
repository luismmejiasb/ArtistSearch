//
//  ArtistDetailInterfaces.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/21/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

protocol ArtistDetailWireframeInterface: WireframeInterface {
}

protocol ArtistDetailViewInterface: ViewInterface {
    func setFavoriteState(_ state: Bool)
}

protocol ArtistDetailPresenterInterface: PresenterInterface {
    func displaySelectedArtistInformation(_ viewController: ArtistDetailViewController)
    func showItunesProfileFrom() 
    func markFavoriteArtist()
    func unmarkFavoriteArtist()
    func validateFavoriteArtist()
    func showFavoriteInformation(_ viewController: ArtistDetailViewController)
}

protocol ArtistDetailInteractorInterface: InteractorInterface {
    func saveArtist(_ artist: Artist, completion: @escaping (Bool) -> Void)
    func deleteArtist(_ artist: Artist, completion: @escaping (Bool) -> Void)
    func isFavorite(_ artist : Artist) -> Bool
}
