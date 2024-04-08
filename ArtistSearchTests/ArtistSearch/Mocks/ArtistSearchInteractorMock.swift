@testable import ArtistSearch

class ArtistSearchInteractorMock: ArtistSearchInteractorProtocol {
    var functionsCalled: [String] = .init()

    func searchTerm(withFilteringType _: FilteringType, and _: String, completion _: @escaping ([Artist], Int) -> Void) {
        functionsCalled.append(#function)
    }

    func cancelAPIRequest() {
        functionsCalled.append(#function)
    }
}
