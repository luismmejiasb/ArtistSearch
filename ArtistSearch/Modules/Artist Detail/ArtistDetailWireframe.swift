import UIKit
import Combine

class ArtistDetailWireframe: ArtistDetailWireFrameProtocol {
    static func assemble(withSelectedArtist: Artist) -> ArtistDetailViewController {
        let localDataSource = ArtistDetailLocalDataSource()
        let repository = ArtistDetailRepository(localDataSource: localDataSource)
        let interactor = ArtistDetailInteractor(repository: repository)
        let publisher = PassthroughSubject<ArtistDetailPublisherAction, Error>()
        let presenter = ArtistDetailPresenter(interactor: interactor, selectedArtist: withSelectedArtist)
        let router =  ArtistDetailRouter()
        let view = ArtistDetailViewController()

        router.view = view
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        interactor.publisher = publisher
        
        return view
    }

}
