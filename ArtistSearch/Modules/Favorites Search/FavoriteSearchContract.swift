import RealmSwift
import UIKit
import Combine

protocol FavoriteSearchWireframeProtocol: class {
    static func assemble() -> FavoriteSearchViewController
}

protocol FavoriteSearchViewProtocol: class {
    func reloadDataInView(with artistsData: [ArtistObject])
}

protocol FavoriteSearchPresenterProtocol: class {
    var view: FavoriteSearchViewProtocol? { get set }
    var interactor: FavoriteSearchInteractorProtocol? { get set }
    var router: FavoriteSearchRouterProtocol? { get set }

    func presentArtistDetail(_ artist: Artist)
}

protocol FavoriteSearchInteractorProtocol: class {
    var publisher: PassthroughSubject<FavoriteSearchPublisherAction, Error>? { get set }

    func findAllFavoriteArtist()
}

protocol FavoriteSearchRouterProtocol: class {
    var view: FavoriteSearchViewController? { get set }
    
    func presentArtistDetail(_ artist: Artist)
    func displayAlert(withMessage message: String)
}

enum FavoriteSearchPublisherAction {
    case favoriteSearchFetched([ArtistObject])
    case favoriteSearchFetcheFailure(Error)
}
