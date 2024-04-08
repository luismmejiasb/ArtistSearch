import Combine

class ArtistSearchPresenter: ArtistSearchPresenterProtocol {
    var view: ArtistSearchViewProtocol?
    var interactor: ArtistSearchInteractorProtocol?
    var router: ArtistSearchRouterProtocol?
    private var searchTermTokens = Set<AnyCancellable>()

    init(interactor: ArtistSearchInteractorProtocol, router: ArtistSearchRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        subscribePublishers()
    }

    func subscribePublishers() {
        interactor?.publisher?.sink(
            receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    print("Publisher stopped obversing")
                case let .failure(error):
                    self?.router?.displayAlert(withMessage: error.localizedDescription)
                }
            }, receiveValue: { [weak self] action in
                switch action {
                case let .displayFoundArtists(artists):
                    self?.view?.reloadDataInView(with: artists)
                case let .displayErrorAlert(error):
                    self?.router?.displayAlert(withMessage: error.localizedDescription)
                }
            }
        ).store(in: &searchTermTokens)
    }

    func searchTerm(type filterType: FilteringType, and termString: String) {
        interactor?.searchTerm(withFilteringType: filterType, and: termString)
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
