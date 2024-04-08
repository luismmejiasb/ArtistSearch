import Combine
import UIKit

final class FavoriteSearchPresenter: FavoriteSearchPresenterProtocol {
    var view: FavoriteSearchViewProtocol?
    var interactor: FavoriteSearchInteractorProtocol?
    var router: FavoriteSearchRouterProtocol?
    private var favoriteSearchTokens = Set<AnyCancellable>()

    init(interactor: FavoriteSearchInteractorProtocol, router: FavoriteSearchRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        subscribePublishers()
    }

    private func subscribePublishers() {
        interactor?.publisher?.sink(
            receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    print("Publisher stopped obversing")
                case let .failure(error):
                    self?.router?.displayAlert(withMessage: error.localizedDescription)
                }
            },
            receiveValue: { [weak self] action in
                switch action {
                case let .favoriteSearchFetched(artists):
                    self?.view?.reloadDataInView(with: artists)
                case let .favoriteSearchFetchFailure(error):
                    print(error)
                }
            }
        ).store(in: &favoriteSearchTokens)
    }

    func presentFavoriteSearchs() {
        interactor?.findAllFavoriteArtist()
    }

    func presentArtistDetail(_ artist: Artist) {
        router?.presentArtistDetail(artist)
    }
}
