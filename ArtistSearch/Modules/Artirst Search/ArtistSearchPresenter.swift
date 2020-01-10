//
//  ArtistSearchPresenter.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

class ArtistSearchPresenter {

    // MARK: - Private properties -

    private unowned let view: ArtistSearchViewInterface
    private let interactor: ArtistSearchInteractorInterface
    private let wireframe: ArtistSearchWireframeInterface

    // MARK: - Lifecycle -

    init(view: ArtistSearchViewInterface, interactor: ArtistSearchInteractorInterface, wireframe: ArtistSearchWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension ArtistSearchPresenter: ArtistSearchPresenterInterface {
    
    func searchTerm(type filterType: FilteringType, and termString: String) {
        view.showProgressHUD()
        interactor.searchTerm(withFilteringType: filterType, and: termString) { artistsEntity, resultCode  in
            self.view.hideProgressHUD()
            if resultCode != 200 {
                self.wireframe.handdleHTTPError(withErrorCode: resultCode)
                return
            }
            self.view.reloadDataInView(with: artistsEntity)
        }
    }

    func cancelAPIRequest() {
        interactor.cancelAPIRequest()
    }
    
}
