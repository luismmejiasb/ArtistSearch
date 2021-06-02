import UIKit
import Combine

class ArtistSearchWireframe: ArtistSearchWireframeProtocol {
    static func assemble() -> UINavigationController {
        let cloudDataSource = ArtistSearchCloudDataSource()
        let repository = ArtistSearchRepository(cloudDataSource: cloudDataSource)
        let interactor = ArtistSearchInteractor(repository: repository)
        let publisher = PassthroughSubject<ArtistSearchPublisherAction, Error>()
        let router = ArtistSearchRouter()
        let presenter = ArtistSearchPresenter(interactor: interactor, router: router)
        let artistSearchViewController = ArtistSearchViewController()
        let navigationController = UINavigationController()

        navigationController.setUpNavigationController()
        navigationController.setViewControllers([artistSearchViewController], animated: false)
        
        router.view = artistSearchViewController
        artistSearchViewController.presenter = presenter
        presenter.view = artistSearchViewController
        interactor.publisher = publisher
        
        return navigationController
    }

}
