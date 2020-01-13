//
//  FavoriteSearchWireframe.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

class FavoriteSearchWireframe: FavoriteSearchWireframeProtocol {
    static func assemble() -> FavoriteSearchViewController {
        let interactor = FavoriteSearchInteractor()
        let router = FavoriteSearchRouter()
        let presenter = FavoriteSearchPresenter(interactor: interactor, router: router)
        let view = FavoriteSearchViewController()

        router.view = view
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
