//
//  ArtistSearchInterfaces.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

protocol ArtistSearchWireframeInterface: WireframeInterface {
}

protocol ArtistSearchViewInterface: ViewInterface {
    func reloadDataInView(with artistsData : [Artist])
}

protocol ArtistSearchPresenterInterface: PresenterInterface {
    func searchTerm(with filterType: FilteringType, and termString: String)
    func cancelAPIRequest()
}

protocol ArtistSearchInteractorInterface: InteractorInterface {
    func searchTerm(withFilteringType filterType : FilteringType, and termString: String, completion: @escaping ([Artist], _ resultCode : Int) -> Void)
    func cancelAPIRequest()
}
