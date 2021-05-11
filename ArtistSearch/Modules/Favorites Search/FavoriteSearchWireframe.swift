import UIKit

class FavoriteSearchWireframe: FavoriteSearchWireframeProtocol {
    static func assemble() -> FavoriteSearchViewController {
        let interactor = FavoriteSearchInteractor()
        let router = FavoriteSearchRouter()
        let presenter = FavoriteSearchPresenter(interactor: interactor, router: router)
        let view = FavoriteSearchViewController()

        router.view = view
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
