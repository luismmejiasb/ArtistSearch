//
//  ArtistSearchInteractor.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import Foundation
import Alamofire

final class ArtistSearchInteractor {
    var apiRequestClient : Request?
}

// MARK: - Extensions -

extension ArtistSearchInteractor: ArtistSearchInteractorInterface {
    
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
                }
                else {
                    completion(artistsData, 0)
                }
                break
                
            case .failure(let error):
                if error._code != NSURLErrorCancelled {
                    completion([], error._code)
                }
                break
                
            }
        }
    }
    
    func cancelAPIRequest() {
        apiRequestClient?.cancel()
    }
}
