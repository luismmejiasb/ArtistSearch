//
//  FavoriteSearchInterfaces.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

protocol FavoriteSearchWireframeInterface: WireframeInterface {
}

protocol FavoriteSearchViewInterface: ViewInterface {
    func reloadDataInView(with artistsData : [ArtistObject])
}

protocol FavoriteSearchPresenterInterface: PresenterInterface {
}

protocol FavoriteSearchInteractorInterface: InteractorInterface {
    func findAllFavoriteArtist( completion: @escaping ([ArtistObject]) -> Void)
}
