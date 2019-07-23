//
//  ArtistDetailPresenter.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/21/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit
import RealmSwift

final class ArtistDetailPresenter {

    // MARK: - Private properties -

    private unowned let view: ArtistDetailViewInterface
    private let interactor: ArtistDetailInteractorInterface
    private let wireframe: ArtistDetailWireframeInterface
    
    var selectedArtist: Artist?

    // MARK: - Lifecycle -

    init(view: ArtistDetailViewInterface, interactor: ArtistDetailInteractorInterface, wireframe: ArtistDetailWireframeInterface, selectedArtist: Artist) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.selectedArtist = selectedArtist
        
    }
}

// MARK: - Extensions -

extension ArtistDetailPresenter: ArtistDetailPresenterInterface {
    
    func displaySelectedArtistInformation(_ viewController: ArtistDetailViewController) {
        viewController.title = selectedArtist?.artistName
        viewController.genderLabel.text = selectedArtist?.primaryGenreName
    }
    
    func showItunesProfileFrom() {
        guard let artistLinkUrlString = selectedArtist?.artistLinkUrl, let artistLinkUrl = URL(string: artistLinkUrlString) else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(artistLinkUrl, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(artistLinkUrl)
        }
    }
    
    func showFavoriteInformation(_ viewController: ArtistDetailViewController) {

        let messageString = NSLocalizedString("favorite_artist_alert_message", comment: "")

        let alert = UIAlertController(title: NSLocalizedString("favorite_artist_alert_title", comment: ""), 
                                      message: String(format: messageString, 
                                                      selectedArtist?.artistName ?? NSLocalizedString("favorite_artist_alert_message_conecting", 
                                                      comment: "")), 
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func markFavoriteArtist() {
        interactor.saveArtist(selectedArtist!) { completion in
            if completion {
                self.wireframe.showAlert(with: NSLocalizedString("success_action_title", comment: ""), 
                                         message: NSLocalizedString("mark_favorite_success_message", comment: ""))
            } else {
                self.wireframe.showAlert(with: NSLocalizedString("failure_action_title", comment: ""), 
                                         message: NSLocalizedString("mark_favorite_failure_message", comment: ""))
            }
            
            self.validateFavoriteArtist()
        }
    }
    
    func unmarkFavoriteArtist() {
        interactor.deleteArtist(selectedArtist!) { completion in
            if completion {
                self.wireframe.showAlert(with: NSLocalizedString("success_action_title", comment: ""), 
                                         message: NSLocalizedString("unmark_favorite_success_message", comment: ""))
            } else {
                self.wireframe.showAlert(with: NSLocalizedString("failure_action_title", comment: ""), 
                                         message: NSLocalizedString("unmark_favorite_failure_message", comment: ""))
            }
            self.validateFavoriteArtist()
        }
    }
    
    func validateFavoriteArtist() {
        if let artist = selectedArtist {
            view.setFavoriteState(interactor.isFavorite(artist))
        } else {
            view.setFavoriteState(false)
        }
    }
}
