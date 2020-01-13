//
//  ArtistSearchWireframe.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//
import UIKit

class ArtistSearchWireframe: ArtistSearchWireframeProtocol {
    static func assemble() -> UINavigationController {
        let interactor = ArtistSearchInteractor()
        let router = ArtistSearchRouter()
        let presenter = ArtistSearchPresenter(interactor: interactor, router: router)
        let artistSearchViewController = ArtistSearchViewController()
        
        let navigationController = UINavigationController()
        navigationController.setUpNavigationController()
        navigationController.setViewControllers([artistSearchViewController], animated: false)
        
        router.view = artistSearchViewController
        artistSearchViewController.presenter = presenter
        presenter.view = artistSearchViewController
        
        return navigationController
    }

}
