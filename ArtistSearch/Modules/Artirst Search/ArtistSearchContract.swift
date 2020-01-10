//
//  ArtistSearchInterfaces.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//
import Foundation
import UIKit

protocol ArtistSearchWireframeProtocol: class {
    static func assemble()-> UINavigationController
}

protocol ArtistSearchViewProtocol: class {
    var presenter: ArtistSearchPresenterProtocol? { get set }

    func reloadDataInView(with artistsData : [Artist])
}

protocol ArtistSearchPresenterProtocol: class {
    var view: ArtistSearchViewProtocol? { get set }
    var interactor: ArtistSearchInteractorProtocol? { get set }
    var router: ArtistSearchRouterProtocol? { get set }

    func searchTerm(type filterType: FilteringType, and termString: String)
    func presentArtistDetail(_ artist: Artist)
    func cancelAPIRequest()
}

protocol ArtistSearchInteractorProtocol: class {
    func searchTerm(withFilteringType filterType: FilteringType, and termString: String, completion: @escaping ([Artist], _ resultCode : Int) -> Void)
    func cancelAPIRequest()
}

protocol ArtistSearchRouterProtocol: class {
    var view: ArtistSearchViewController? { get set }
    
    func presentArtistDetail(_ artist: Artist)
}
