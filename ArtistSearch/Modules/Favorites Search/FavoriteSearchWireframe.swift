//
//  FavoriteSearchWireframe.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

final class FavoriteSearchWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard.favoriteSearchStoryBoard()

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: FavoriteSearchViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = FavoriteSearchInteractor()
        let presenter = FavoriteSearchPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension FavoriteSearchWireframe: FavoriteSearchWireframeInterface {
    
}
