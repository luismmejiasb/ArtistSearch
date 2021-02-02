@testable import ArtistSearch

class ArtistSearchRouterMock: ArtistSearchRouterProtocol {
    var functionsCalled: [String] = [String]()
    var view: ArtistSearchViewController?
    
    func presentArtistDetail(_ artist: Artist) {
        functionsCalled.append(#function)
    }

    func presentFavoriteSearchs() {
        functionsCalled.append(#function)
    }

}
