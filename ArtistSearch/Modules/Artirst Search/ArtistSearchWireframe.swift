//
//  ArtistSearchWireframe.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

final class ArtistSearchWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard.artistSearchStoryBoard()

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: ArtistSearchViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = ArtistSearchInteractor()
        let router = ArtistSearchRouter()
        let presenter = ArtistSearchPresenter(interactor: interactor, router: router)
        let view = ArtistSearchViewController()
        
        router.view = view
        view.presenter = presenter
        presenter.view = view
        
        return view
    }

}

// MARK: - Extensions -

extension ArtistSearchWireframe: ArtistSearchWireframeInterface {}
