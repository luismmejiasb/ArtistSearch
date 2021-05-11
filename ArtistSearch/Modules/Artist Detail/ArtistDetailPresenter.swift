import UIKit
import RealmSwift

final class ArtistDetailPresenter: ArtistDetailPresenterProtocol {    
    var view: ArtistDetailViewProtocol?
    var interactor: ArtistDetailInteractorProtocol?
    var router: ArtistDetailRouterProtocol?
    var selectedArtist: Artist?

    init(interactor: ArtistDetailInteractorProtocol, selectedArtist: Artist) {
        self.interactor = interactor
        self.selectedArtist = selectedArtist
        
    }
    
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
        interactor?.saveArtist(selectedArtist!) { completion in
            if completion {
                self.router?.displayAlert(withMessage: NSLocalizedString("mark_favorite_success_message", comment: ""))
            } else {
                self.router?.displayAlert(withMessage: NSLocalizedString("mark_favorite_failure_message", comment: ""))
            }
            
            self.validateFavoriteArtist()
        }
    }
    
    func unmarkFavoriteArtist() {
        interactor?.deleteArtist(selectedArtist!) { completion in
            if completion {
                self.router?.displayAlert(withMessage: NSLocalizedString("unmark_favorite_success_message", comment: ""))
            } else {
                self.router?.displayAlert(withMessage: NSLocalizedString("unmark_favorite_failure_message", comment: ""))
            }

            self.validateFavoriteArtist()
        }
    }
    
    func validateFavoriteArtist() {
        if let artist = selectedArtist {
            view?.setFavoriteState(interactor?.isFavorite(artist) ?? false)
        } else {
            view?.setFavoriteState(false)
        }
    }
    
    func displayAlert(withMessage message: String) {
        router?.displayAlert(withMessage: message)
    }
}
