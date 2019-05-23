//
//  ArtistDetailWireframe.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/21/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

final class ArtistDetailWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard.artistDetailStoryBoard()

    // MARK: - Module setup -

    init(selectedArtist: Artist) {
        let moduleViewController = storyboard.instantiateViewController(ofType: ArtistDetailViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = ArtistDetailInteractor()
        let presenter = ArtistDetailPresenter(view: moduleViewController, interactor: interactor, wireframe: self, selectedArtist: selectedArtist)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ArtistDetailWireframe: ArtistDetailWireframeInterface {
}
