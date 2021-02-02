import UIKit

class FavoriteSearchRouter: FavoriteSearchRouterProtocol {
    var view: FavoriteSearchViewController?

    func presentArtistDetail(_ artist: Artist) {
        let artistDetailController = ArtistDetailWireframe.assemble(withSelectedArtist: artist)
        view?.navigationController?.pushViewController(artistDetailController, animated: true)
    }
}
