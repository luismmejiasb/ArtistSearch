import UIKit

final class ArtistDetailWireframe: ArtistDetailWireFrameProtocol {
    static func assemble(withSelectedArtist: Artist) -> ArtistDetailViewController {
        let interactor = ArtistDetailInteractor()
        let presenter = ArtistDetailPresenter(interactor: interactor, selectedArtist: withSelectedArtist)
        let view = ArtistDetailViewController()

        view.presenter = presenter
        presenter.view = view
        
        return view
    }

}
