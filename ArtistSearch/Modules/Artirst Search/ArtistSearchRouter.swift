import UIKit

class ArtistSearchRouter: ArtistSearchRouterProtocol {
    var view: ArtistSearchViewController?

    func presentArtistDetail(_ artist: Artist) {
        let artistDetailController = ArtistDetailWireframe.assemble(withSelectedArtist: artist)
        view?.navigationController?.pushViewController(artistDetailController, animated: true)
    }

    func presentFavoriteSearchs() {
        let favoriteSearchController = FavoriteSearchWireframe.assemble()
        view?.navigationController?.pushViewController(favoriteSearchController, animated: true)
    }
}
