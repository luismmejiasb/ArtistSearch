import Combine
import UIKit

final class ArtistDetailPresenter: ArtistDetailPresenterProtocol {
    var view: ArtistDetailViewProtocol?
    var interactor: ArtistDetailInteractorProtocol?
    var router: ArtistDetailRouterProtocol?
    var selectedArtist: Artist?
    private var artistDetailTokens = Set<AnyCancellable>()

    init(interactor: ArtistDetailInteractorProtocol, selectedArtist: Artist) {
        self.interactor = interactor
        self.selectedArtist = selectedArtist
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
                    self?.router?.displayAlert(with: .generic(error))
                }
            },
            receiveValue: { [weak self] action in
                switch action {
                case .artistSavedSuccess:
                    self?.router?.displayAlert(with: .artistSavedSuccess)
                    self?.validateFavoriteArtist()

                case .artistDeletedSuccess:
                    self?.router?.displayAlert(with: .artistDeletedSuccess)
                    self?.validateFavoriteArtist()

                case let .artistSavedError(error):
                    self?.router?.displayAlert(with: .artistSavedError(error))

                case let .artistDeletedError(error):
                    self?.router?.displayAlert(with: .artistDeletedError(error))
                }
            }
        ).store(in: &artistDetailTokens)
    }

    func displaySelectedArtistInformation(_ viewController: ArtistDetailViewController) {
        viewController.title = selectedArtist?.artistName
        viewController.genderLabel.text = selectedArtist?.primaryGenreName
    }

    func showItunesProfile() {
        guard let artistLinkUrlString = selectedArtist?.artistLinkUrl, let artistLinkUrl = URL(string: artistLinkUrlString) else {
            return
        }

        UIApplication.shared.open(artistLinkUrl, options: [:], completionHandler: nil)
    }

    func showFavoriteInformation() {
        router?.showFavoriteInformation(withArtist: selectedArtist ?? Artist())
    }

    func markFavoriteArtist() {
        interactor?.saveArtist(selectedArtist!)
    }

    func unmarkFavoriteArtist() {
        interactor?.deleteArtist(selectedArtist!)
    }

    func validateFavoriteArtist() {
        if let artist = selectedArtist {
            view?.setFavoriteState(interactor?.isFavorite(artist) ?? false)
        } else {
            view?.setFavoriteState(false)
        }
    }

    func displayAlert(with alertType: AlertType) {
        router?.displayAlert(with: alertType)
    }
}
