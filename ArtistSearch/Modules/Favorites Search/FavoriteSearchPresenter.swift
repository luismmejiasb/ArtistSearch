//
//  FavoriteSearchPresenter.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

final class FavoriteSearchPresenter: FavoriteSearchPresenterProtocol {
    var view: FavoriteSearchViewProtocol?
    var interactor: FavoriteSearchInteractorProtocol?
    var router: FavoriteSearchRouterProtocol?

    init(interactor: FavoriteSearchInteractorProtocol, router: FavoriteSearchRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func presentFavoriteSearchs() {
        interactor?.findAllFavoriteArtist { (artists) in
            self.view?.reloadDataInView(with: artists)
        }
    }
    
    func presentArtistDetail(_ artist: Artist) {
        router?.presentArtistDetail(artist)
    }
    
}
