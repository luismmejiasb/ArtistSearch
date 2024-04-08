import Combine
import UIKit

protocol ArtistSearchWireframeProtocol: class {
    static func assemble() -> UINavigationController
}

protocol ArtistSearchViewProtocol: class {
    var presenter: ArtistSearchPresenterProtocol? { get set }

    func reloadDataInView(with artistData: [Artist])
}

protocol ArtistSearchPresenterProtocol: class {
    var view: ArtistSearchViewProtocol? { get set }
    var interactor: ArtistSearchInteractorProtocol? { get set }
    var router: ArtistSearchRouterProtocol? { get set }

    func viewDidLoad()
    func searchTerm(type filterType: FilteringType, and termString: String)
    func presentArtistDetail(_ artist: Artist)
    func presentFavoriteSearchs()
}

protocol ArtistSearchInteractorProtocol: class {
    var repository: ArtistSearchRepositoryProtocol? { get set }
    var publisher: PassthroughSubject<ArtistSearchPublisherAction, Error>? { get set }

    func searchTerm(withFilteringType filterType: FilteringType, and termString: String)
}

protocol ArtistSearchRouterProtocol: class {
    var view: ArtistSearchViewController? { get set }

    func presentArtistDetail(_ artist: Artist)
    func presentFavoriteSearchs()
    func displayAlert(withMessage message: String)
}

enum ArtistSearchPublisherAction {
    case displayFoundArtists([Artist])
    case displayErrorAlert(Error)
}
