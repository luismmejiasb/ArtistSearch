import Alamofire
import Combine
import Foundation

class ArtistSearchCloudDataSource: ArtistSearchCloudDataSourceProtocol {
    func searchArtist(withFilteringType filterType: FilteringType, and termString: String) -> Future<[Artist], Error> {
        return Future { promise in

            let enteredText: String = (termString.replacingOccurrences(of: " ", with: "+"))
            let requestUrlString: String = filterType.filteringTypeURL + enteredText

            AF.request(requestUrlString, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { response in

                switch response.result {
                case let .success(response):
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
                        let searchResult = try JSONDecoder().decode(SearchResult.self, from: jsonData)
                        return promise(.success(searchResult.results))
                    } catch {
                        return promise(.failure(CloudSourceErrors.responseCannotBeParsed))
                    }

                case let .failure(error):
                    promise(.failure(error))
                }
            }
        }
    }
}
