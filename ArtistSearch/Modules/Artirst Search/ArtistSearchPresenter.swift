//
//  ArtistSearchPresenter.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

class ArtistSearchPresenter: ArtistSearchPresenterProtocol {
    var view: ArtistSearchViewProtocol?
    var interactor: ArtistSearchInteractorProtocol?
    var router: ArtistSearchRouterProtocol?
    
    init(interactor: ArtistSearchInteractorProtocol, router: ArtistSearchRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func searchTerm(type filterType: FilteringType, and termString: String) {
        interactor?.searchTerm(withFilteringType: filterType, and: termString) { artistsEntity, resultCode  in
            if resultCode != 200 {
                //self.wireframe.handdleHTTPError(withErrorCode: resultCode)
                return
            }
            self.view?.reloadDataInView(with: artistsEntity)
        }
    }

    func cancelAPIRequest() {
        interactor?.cancelAPIRequest()
    }

    func presentArtistDetail(_ artist: Artist) {
        router?.presentArtistDetail(artist)
    }

    func presentFavoriteSearchs() {
        router?.presentFavoriteSearchs()
    }
}
