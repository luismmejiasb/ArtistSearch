import Combine

class FavoriteSearchInteractor: FavoriteSearchInteractorProtocol {
    var repository: FavoriteSearchRepositoryProtocol?
    private var favoriteSearchTokens = Set<AnyCancellable>()
    var publisher: PassthroughSubject<FavoriteSearchPublisherAction, Error>?
    
    init(repository: FavoriteSearchRepositoryProtocol) {
        self.repository = repository
    }
    
    func findAllFavoriteArtist() {
        repository?.fetchAllFavoriteArtist()
            .sink(
                receiveCompletion: { (completion) in
                    switch completion {
                    case .finished:
                        print("Publisher stopped obversing")
                    case .failure(let error):
                        self.publisher?.send(FavoriteSearchPublisherAction.favoriteSearchFetchFailure(error))
                    }
                }, receiveValue: { (artists) in
                    self.publisher?.send(FavoriteSearchPublisherAction.favoriteSearchFetched(artists))
                }).store(in: &favoriteSearchTokens)
    }
    
}
