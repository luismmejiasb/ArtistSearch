import UIKit

final class ArtistDetailWireframe: ArtistDetailWireFrameProtocol {
    static func assemble(withSelectedArtist: Artist) -> ArtistDetailViewController {
        let interactor = ArtistDetailInteractor()
        let presenter = ArtistDetailPresenter(interactor: interactor, selectedArtist: withSelectedArtist)
        let router =  ArtistDetailRouter()
        let view = ArtistDetailViewController()

        router.view = view
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        
        return view
    }

}
