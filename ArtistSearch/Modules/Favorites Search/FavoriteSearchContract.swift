//
//  FavoriteSearchInterfaces.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

protocol FavoriteSearchWireframeProtocol: class {
    static func assemble() -> FavoriteSearchViewController
}

protocol FavoriteSearchViewProtocol: class {
    func reloadDataInView(with artistsData : [ArtistObject])
}

protocol FavoriteSearchPresenterProtocol: class {
    func presentFavoriteSearchs()
    func didTapOnFavoriteArtist(witArtist artist: Artist)

    var view: FavoriteSearchViewProtocol? { get set }
    var interactor: FavoriteSearchInteractorProtocol? { get set }
    var router: FavoriteSearchRouterProtocol? { get set }
}

protocol FavoriteSearchInteractorProtocol: class {
    func findAllFavoriteArtist( completion: @escaping ([ArtistObject]) -> Void)
}

protocol FavoriteSearchRouterProtocol: class {
    var view: FavoriteSearchViewController? { get set }
    
    func presentArtistDetail(_ artist: Artist)
}
