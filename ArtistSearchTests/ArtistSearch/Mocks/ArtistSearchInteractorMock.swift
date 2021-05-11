@testable import ArtistSearch

class ArtistSearchInteractorMock: ArtistSearchInteractorProtocol {
    var functionsCalled: [String] = [String]()
    
    func searchTerm(withFilteringType filterType: FilteringType, and termString: String, completion: @escaping ([Artist], Int) -> Void) {
        functionsCalled.append(#function)
    }
    
    func cancelAPIRequest() {
        functionsCalled.append(#function)
    }

}
