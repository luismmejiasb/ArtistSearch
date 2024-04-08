import Combine
import UIKit

final class FavoriteSearchWireframe: FavoriteSearchWireframeProtocol {
    static func assemble() -> FavoriteSearchViewController {
        let localDataSource = FavoriteSearchLocalDataSource()
        let repository = FavoriteSearchRepository(localDataSource: localDataSource)
        let publisher = PassthroughSubject<FavoriteSearchPublisherAction, Error>()
        let interactor = FavoriteSearchInteractor(repository: repository)
        let router = FavoriteSearchRouter()
        let presenter = FavoriteSearchPresenter(interactor: interactor, router: router)
        let view = FavoriteSearchViewController()

        router.view = view
        view.presenter = presenter
        presenter.view = view
        interactor.publisher = publisher

        return view
    }
}
