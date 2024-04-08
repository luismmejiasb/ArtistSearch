import Combine
import RealmSwift
import UIKit

protocol FavoriteSearchWireframeProtocol: AnyObject {
    static func assemble() -> FavoriteSearchViewController
}

protocol FavoriteSearchViewProtocol: AnyObject {
    func reloadDataInView(with artistsData: [ArtistObject])
}

protocol FavoriteSearchPresenterProtocol: AnyObject {
    var view: FavoriteSearchViewProtocol? { get set }
    var interactor: FavoriteSearchInteractorProtocol? { get set }
    var router: FavoriteSearchRouterProtocol? { get set }

    func presentArtistDetail(_ artist: Artist)
}

protocol FavoriteSearchInteractorProtocol: AnyObject {
    var publisher: PassthroughSubject<FavoriteSearchPublisherAction, Error>? { get set }

    func findAllFavoriteArtist()
}

protocol FavoriteSearchRouterProtocol: AnyObject {
    var view: FavoriteSearchViewController? { get set }

    func presentArtistDetail(_ artist: Artist)
    func displayAlert(withMessage message: String)
}

enum FavoriteSearchPublisherAction {
    case favoriteSearchFetched([ArtistObject])
    case favoriteSearchFetchFailure(Error)
}
