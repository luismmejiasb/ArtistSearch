import Combine
import Foundation

final class ArtistDetailInteractor: ArtistDetailInteractorProtocol {
    var repository: ArtistDetailRepositoryProtocol?
    private var artistDetailTokens = Set<AnyCancellable>()
    var publisher: PassthroughSubject<ArtistDetailPublisherAction, Error>?

    init(repository: ArtistDetailRepositoryProtocol?) {
        self.repository = repository
    }

    func saveArtist(_ artist: Artist) {
        repository?.saveArtist(artist)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("Publisher stopped observing")
                    case let .failure(error):
                        self.publisher?.send(ArtistDetailPublisherAction.artistSavedError(error))
                    }
                },
                receiveValue: { _ in
                    self.publisher?.send(ArtistDetailPublisherAction.artistSavedSuccess(()))
                }
            )
            .store(in: &artistDetailTokens)
    }

    func deleteArtist(_ artist: Artist) {
        repository?.deleteArtist(artist)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("Publisher stopped observing")
                    case let .failure(error):
                        self.publisher?.send(ArtistDetailPublisherAction.artistDeletedError(error))
                    }
                },
                receiveValue: { _ in
                    self.publisher?.send(ArtistDetailPublisherAction.artistDeletedSuccess(()))
                }
            )
            .store(in: &artistDetailTokens)
    }

    func isFavorite(_ artist: Artist) -> Bool {
        return repository?.isFavorite(artist) ?? false
    }
}
