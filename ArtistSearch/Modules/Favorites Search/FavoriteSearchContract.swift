import UIKit

protocol FavoriteSearchWireframeProtocol: class {
    static func assemble() -> FavoriteSearchViewController
}

protocol FavoriteSearchViewProtocol: class {
    func reloadDataInView(with artistsData : [ArtistObject])
}

protocol FavoriteSearchPresenterProtocol: class {
    var view: FavoriteSearchViewProtocol? { get set }
    var interactor: FavoriteSearchInteractorProtocol? { get set }
    var router: FavoriteSearchRouterProtocol? { get set }

    func presentArtistDetail(_ artist: Artist)
}

protocol FavoriteSearchInteractorProtocol: class {
    func findAllFavoriteArtist( completion: @escaping ([ArtistObject]) -> Void)
}

protocol FavoriteSearchRouterProtocol: class {
    var view: FavoriteSearchViewController? { get set }
    
    func presentArtistDetail(_ artist: Artist)
}
