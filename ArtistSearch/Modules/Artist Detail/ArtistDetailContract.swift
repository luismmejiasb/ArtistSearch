import Combine
import UIKit

protocol ArtistDetailWireFrameProtocol: AnyObject {
    static func assemble(withSelectedArtist: Artist) -> ArtistDetailViewController
}

protocol ArtistDetailViewProtocol: AnyObject {
    var presenter: ArtistDetailPresenterProtocol? { get set }

    func setFavoriteState(_ state: Bool)
}

protocol ArtistDetailPresenterProtocol: AnyObject {
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
    func displayAlert(with AlertType: AlertType)
}

protocol ArtistDetailInteractorProtocol: AnyObject {
    var publisher: PassthroughSubject<ArtistDetailPublisherAction, Error>? { get set }

    func saveArtist(_ artist: Artist)
    func deleteArtist(_ artist: Artist)
    func isFavorite(_ artist: Artist) -> Bool
}

public enum AlertType {
    case artistSavedSuccess
    case artistSavedError(Error)
    case artistDeletedSuccess
    case artistDeletedError(Error)
    case generic(Error)

    var title: String {
        switch self {
        case .artistSavedSuccess:
            return NSLocalizedString("artist_saved_success_title", comment: "")
        case .artistSavedError:
            return NSLocalizedString("artist_saved_error_title", comment: "")
        case .artistDeletedSuccess:
            return NSLocalizedString("artist_deleted_success_title", comment: "")
        case .artistDeletedError:
            return NSLocalizedString("artist_deleted_error_title", comment: "")
        case .generic:
            return NSLocalizedString("generic_error_title", comment: "")
        }
    }
}

protocol ArtistDetailRouterProtocol: AnyObject {
    var view: ArtistDetailViewController? { get set }

    func displayAlert(with alertType: AlertType)
    func showFavoriteInformation(withArtist artist: Artist)
}

enum ArtistDetailPublisherAction {
    case artistSavedSuccess(Void)
    case artistDeletedSuccess(Void)
    case artistSavedError(Error)
    case artistDeletedError(Error)
}
