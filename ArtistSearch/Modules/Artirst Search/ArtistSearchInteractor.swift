import Foundation
import Alamofire
import Combine

class ArtistSearchInteractor: ArtistSearchInteractorProtocol {
    var repository: ArtistSearchRepositoryProtocol?
    var searchTermAnyCancellable: AnyCancellable?
    
    init(repository: ArtistSearchRepositoryProtocol?) {
        self.repository = repository
    }

    func searchTerm(withFilteringType filterType : FilteringType, and termString: String) {
        searchTermAnyCancellable = repository?.searchArtist(withFilteringType: filterType, and: termString)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { (completion) in
                    switch completion {
                    case .finished:
                        print("Publisher stopped obversing")
                    case .failure(let error):
                        print("This is any other passed to our future", error)
                    }
                    
                }, receiveValue: { (artists) in
                    print("Result: \(artists)")
                })
    }
}
