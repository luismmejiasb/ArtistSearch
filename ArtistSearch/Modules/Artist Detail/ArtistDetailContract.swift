import Combine
import UIKit

protocol ArtistDetailWireFrameProtocol: class {
    static func assemble(withSelectedArtist: Artist) -> ArtistDetailViewController
}

protocol ArtistDetailViewProtocol: class {
    var presenter: ArtistDetailPresenterProtocol? { get set }

    func setFavoriteState(_ state: Bool)
}

protocol ArtistDetailPresenterProtocol: class {
    var view: ArtistDetailViewProtocol? { get set }
    var interactor: ArtistDetailInteractorProtocol? { get set }
    var router: ArtistDetailRouterProtocol? { get set }

    func viewDidLoad()
    func displaySelectedArtistInformation(_ viewController: ArtistDetailViewController)
    func showItunesProfile()
    func markFavoriteArtist()
    func unmarkFavoriteArtist()
    func validateFavoriteArtist()
    func showFavoriteInformation()
    func displayAlert(withMessage message: String)
}

protocol ArtistDetailInteractorProtocol: class {
    var publisher: PassthroughSubject<ArtistDetailPublisherAction, Error>? { get set }

    func saveArtist(_ artist: Artist)
    func deleteArtist(_ artist: Artist)
    func isFavorite(_ artist: Artist) -> Bool
}

protocol ArtistDetailRouterProtocol: class {
    var view: ArtistDetailViewController? { get set }

    func displayAlert(withMessage message: String)
    func showFavoriteInformation(withArtist artist: Artist)
}

enum ArtistDetailPublisherAction {
    case artistSavedSuccess(Void)
    case artistDeletedSuccess(Void)
    case artistSavedError(Error)
    case artistDeletedError(Error)
}
