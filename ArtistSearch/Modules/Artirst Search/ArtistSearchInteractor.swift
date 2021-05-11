import Foundation
import Alamofire

class ArtistSearchInteractor: ArtistSearchInteractorProtocol {
    var apiRequestClient : Request?

    func searchTerm(withFilteringType filterType : FilteringType, and termString: String, completion: @escaping ([Artist], _ resultCode : Int) -> Void) {
        
        let enteredText: String = (termString.replacingOccurrences(of: " ", with: "+"))
        
        let requestUrlString: String = filterType.filteringTypeURL + enteredText
        
        apiRequestClient = Alamofire.request(requestUrlString, method: .get, parameters : nil, headers : nil).validate().responseJSON { response in
            
            switch response.result {
                
            case .success:
                var artistsData: [Artist] = []
                
                if let responseObject: NSDictionary =  response.result.value as? NSDictionary, let resultsArray = responseObject["results"] as? [NSDictionary] {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: resultsArray, options: .prettyPrinted)
                        
                        artistsData = try JSONDecoder().decode([Artist].self, from: jsonData) as [Artist]
                        
                        completion(artistsData, 200)
                        
                    } catch {
                        completion(artistsData, 0)
                        print(error.localizedDescription)
                    }
                } else {
                    completion(artistsData, 0)
                }
                
            case .failure(let error):
                if error._code != NSURLErrorCancelled {
                    completion([], error._code)
                }   
            }
        }
    }
    
    func cancelAPIRequest() {
        apiRequestClient?.cancel()
    }
}
