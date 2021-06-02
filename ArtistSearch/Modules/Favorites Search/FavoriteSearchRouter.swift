import UIKit

class FavoriteSearchRouter: FavoriteSearchRouterProtocol {
    var view: FavoriteSearchViewController?

    func presentArtistDetail(_ artist: Artist) {
        let artistDetailController = ArtistDetailWireframe.assemble(withSelectedArtist: artist)
        view?.navigationController?.pushViewController(artistDetailController, animated: true)
    }

    func displayAlert(withMessage message: String) {
        let alert = UIAlertController(title: NSLocalizedString("generic_alert_title", comment: ""), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("generic_ok_button_title", comment: ""), style: .default, handler: nil))
        view?.present(alert, animated: true, completion: nil)
    }
}
