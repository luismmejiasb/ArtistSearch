//
//  FavoriteSearchPresenter.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

final class FavoriteSearchPresenter {

    // MARK: - Private properties -

    private unowned let view: FavoriteSearchViewInterface
    private let interactor: FavoriteSearchInteractorInterface
    private let wireframe: FavoriteSearchWireframeInterface

    // MARK: - Lifecycle -

    init(view: FavoriteSearchViewInterface, interactor: FavoriteSearchInteractorInterface, wireframe: FavoriteSearchWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
}

// MARK: - Extensions -

extension FavoriteSearchPresenter: FavoriteSearchPresenterInterface {
    
    func presentFavoriteSearchs() {
        interactor.findAllFavoriteArtist { (artists) in
            self.view.reloadDataInView(with: artists)
        }
    }
    
    func presentArtistDetail(_ artist: Artist) {
        router?.presentArtistDetail(artist)
    }
}
