//
//  ArtistDetailWireframe.swift
//  ArtistDetail
//
//  Created by Luis Mejías on 5/21/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

final class ArtistDetailWireframe: ArtistDetailWireFrameProtocol {
    static func assemble(withSelectedArtist: Artist) -> ArtistDetailViewController {
        let interactor = ArtistDetailInteractor()
        let presenter = ArtistDetailPresenter(interactor: interactor, selectedArtist: withSelectedArtist)
        let view = ArtistDetailViewController()

        view.presenter = presenter
        presenter.view = view
        
        return view
    }

}
