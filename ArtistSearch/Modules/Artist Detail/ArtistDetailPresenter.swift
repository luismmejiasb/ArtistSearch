import Combine
import UIKit

class ArtistDetailPresenter: ArtistDetailPresenterProtocol {
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
                    self?.router?.displayAlert(withMessage: error.localizedDescription)
                }
            }, receiveValue: { [weak self] action in
                switch action {
                case .artistSavedSuccess():
                    self?.router?.displayAlert(withMessage: NSLocalizedString("mark_favorite_success_message", comment: ""))
                    self?.validateFavoriteArtist()
                case let .artistSavedError(error):
                    self?.router?.displayAlert(withMessage: NSLocalizedString("mark_favorite_failure_message", comment: "") + "\(error)")
                case .artistDeletedSuccess():
                    self?.router?.displayAlert(withMessage: NSLocalizedString("unmark_favorite_success_message", comment: ""))
                    self?.validateFavoriteArtist()
                case let .artistDeletedError(error):
                    self?.router?.displayAlert(withMessage: NSLocalizedString("unmark_favorite_failure_message", comment: "") + "\(error)")
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

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(artistLinkUrl, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(artistLinkUrl)
        }
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

    func displayAlert(withMessage message: String) {
        router?.displayAlert(withMessage: message)
    }
}
