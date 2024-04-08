import Combine
import Foundation

final class ArtistSearchInteractor: ArtistSearchInteractorProtocol {
    var repository: ArtistSearchRepositoryProtocol?
    private var searchTermTokens = Set<AnyCancellable>()
    var publisher: PassthroughSubject<ArtistSearchPublisherAction, Error>?

    init(repository: ArtistSearchRepositoryProtocol?) {
        self.repository = repository
    }

    func searchTerm(withFilteringType filterType: FilteringType, and termString: String) {
        repository?.searchArtist(withFilteringType: filterType, and: termString)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("Publisher stopped obversing")
                    case let .failure(error):
                        self.publisher?.send(ArtistSearchPublisherAction.displayErrorAlert(error))
                    }
                }, receiveValue: { artists in
                    self.publisher?.send(ArtistSearchPublisherAction.displayFoundArtists(artists))
                }
            ).store(in: &searchTermTokens)
    }
}
