import Combine
import Alamofire
import Foundation

class ArtistSearchCloudDataSource: ArtistSearchCloudDataSourceProtocol {
    func searchArtist(withFilteringType filterType: FilteringType, and termString: String) -> Future<[Artist], Error> {
        return Future { promise in

            let enteredText: String = (termString.replacingOccurrences(of: " ", with: "+"))
            let requestUrlString: String = filterType.filteringTypeURL + enteredText

            AF.request(requestUrlString, method: .get, parameters : nil, headers : nil).validate().responseJSON { response in
                
                switch response.result {
                case .success:
                    var artists: [Artist] = []
                    
                   let responseObject =  response.result.map({ results in
                        print(results)
                   })
                    
                    promise(.success([Artist]()))
                    /*as? Dictionary<AnyHashable, Any>,
                          let resultsArray = responseObject["results"] as? Dictionary else { pri }
                    
                    if let responseObject =  response.result.value as? NSDictionary, let resultsArray = responseObject["results"] as? [NSDictionary] {
                        
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: resultsArray, options: .prettyPrinted)
                            
                            artists = try JSONDecoder().decode([Artist].self, from: jsonData) as [Artist]
                            
                            return Single.just(artists)
                            
                        } catch {
                            return Single.error(new RuntimeException("single2"))
                        }

                    } else {
                        completion(artistsData, 0)
                    }*/
                    
                case .failure(let error):
                    /*if error._code != NSURLErrorCancelled {
                        completion([], error._code)
                    }*/
                    promise(.failure(error))
                }
            }
        }
    }
}
