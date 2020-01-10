//
//  ArtistDetailInterfaces.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/21/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

protocol ArtistDetailWireFrameProtocol: class {
    static func assemble(withSelectedArtist: Artist)-> ArtistDetailViewController
}

protocol ArtistDetailViewProtocol: class {
    var presenter: ArtistDetailPresenterProtocol? { get set }

    func setFavoriteState(_ state: Bool)
}

protocol ArtistDetailPresenterProtocol: class {
    var view: ArtistDetailViewProtocol? { get set }
    var interactor: ArtistDetailInteractorProtocol? { get set }
    var router: ArtistDetailRouterProtocol? { get set }

    func displaySelectedArtistInformation(_ viewController: ArtistDetailViewController)
    func showItunesProfileFrom() 
    func markFavoriteArtist()
    func unmarkFavoriteArtist()
    func validateFavoriteArtist()
    func showFavoriteInformation(_ viewController: ArtistDetailViewController)
}

protocol ArtistDetailInteractorProtocol: class {
    func saveArtist(_ artist: Artist, completion: @escaping (Bool) -> Void)
    func deleteArtist(_ artist: Artist, completion: @escaping (Bool) -> Void)
    func isFavorite(_ artist : Artist) -> Bool
}

protocol ArtistDetailRouterProtocol: class {
    var view: ArtistDetailViewProtocol? { get set }
}
