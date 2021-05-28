import Foundation
import Alamofire

class ArtistSearchInteractor: ArtistSearchInteractorProtocol {

    func searchTerm(withFilteringType filterType : FilteringType, and termString: String, completion: @escaping ([Artist], _ resultCode : Int) -> Void) {
        
    }
    
    func cancelAPIRequest() {
        //apiRequestClient?.cancel()
    }
}
