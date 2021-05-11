import Foundation
import UIKit

protocol ArtistSearchWireframeProtocol: class {
    static func assemble()-> UINavigationController
}

protocol ArtistSearchViewProtocol: class {
    var presenter: ArtistSearchPresenterProtocol? { get set }

    func reloadDataInView(with artistsData : [Artist])
}

protocol ArtistSearchPresenterProtocol: class {
    var view: ArtistSearchViewProtocol? { get set }
    var interactor: ArtistSearchInteractorProtocol? { get set }
    var router: ArtistSearchRouterProtocol? { get set }

    func searchTerm(type filterType: FilteringType, and termString: String)
    func presentArtistDetail(_ artist: Artist)
    func cancelAPIRequest()
    func presentFavoriteSearchs()
}

protocol ArtistSearchInteractorProtocol: class {
    func searchTerm(withFilteringType filterType: FilteringType, and termString: String, completion: @escaping ([Artist], _ resultCode : Int) -> Void)
    func cancelAPIRequest()
}

protocol ArtistSearchRouterProtocol: class {
    var view: ArtistSearchViewController? { get set }
    
    func presentArtistDetail(_ artist: Artist)
    func presentFavoriteSearchs()
    func displayAlert(withMessage message: String)
}
