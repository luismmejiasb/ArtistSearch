import UIKit
import HTTPErrorMessage

class ArtistSearchPresenter: ArtistSearchPresenterProtocol {
    var view: ArtistSearchViewProtocol?
    var interactor: ArtistSearchInteractorProtocol?
    var router: ArtistSearchRouterProtocol?
    
    init(interactor: ArtistSearchInteractorProtocol, router: ArtistSearchRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func searchTerm(type filterType: FilteringType, and termString: String) {
        interactor?.searchTerm(withFilteringType: filterType, and: termString) { artistsEntity, resultCode  in
            if resultCode != 200 {
                self.router?.displayAlert(withMessage: HTTPErrorMessage.getHTTPError(withErrorCode: resultCode))
            }
            self.view?.reloadDataInView(with: artistsEntity)
        }
    }

    func cancelAPIRequest() {
        interactor?.cancelAPIRequest()
    }

    func presentArtistDetail(_ artist: Artist) {
        router?.presentArtistDetail(artist)
    }

    func presentFavoriteSearchs() {
        router?.presentFavoriteSearchs()
    }
    
    func displayAlert(withMessage message: String) {
        router?.displayAlert(withMessage: message)
    }
}
