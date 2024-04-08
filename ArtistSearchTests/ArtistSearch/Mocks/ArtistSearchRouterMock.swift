@testable import ArtistSearch

class ArtistSearchRouterMock: ArtistSearchRouterProtocol {
    var functionsCalled: [String] = .init()
    var view: ArtistSearchViewController?

    func presentArtistDetail(_: Artist) {
        functionsCalled.append(#function)
    }

    func presentFavoriteSearchs() {
        functionsCalled.append(#function)
    }
}
