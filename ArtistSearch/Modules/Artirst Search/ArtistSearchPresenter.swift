import Combine

class ArtistSearchPresenter: ArtistSearchPresenterProtocol {
    var view: ArtistSearchViewProtocol?
    var interactor: ArtistSearchInteractorProtocol?
    var router: ArtistSearchRouterProtocol?

    private var searchTermAnyTokens = Set<AnyCancellable>()

    init(interactor: ArtistSearchInteractorProtocol, router: ArtistSearchRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        subscribePublishers()
    }

    func subscribePublishers() {
        interactor?.publisher?.sink(
            receiveCompletion: { [weak self] (completion) in
                switch completion {
                case .finished:
                    print("Publisher stopped obversing")
                case .failure(let error):
                    self?.router?.displayAlert(withMessage: error.localizedDescription)
                }
            }, receiveValue: { [weak self] (action) in
                switch action {
                case .displayData(let artists):
                    self?.view?.reloadDataInView(with: artists)
                case .displayErrorAlert(let error):
                    self?.router?.displayAlert(withMessage: error.localizedDescription)
                }
            }).store(in: &searchTermAnyTokens)
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
