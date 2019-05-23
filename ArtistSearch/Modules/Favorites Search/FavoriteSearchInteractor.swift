//
//  FavoriteSearchInteractor.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import Foundation
import RealmSwift

final class FavoriteSearchInteractor {
    
}

// MARK: - Extensions -

extension FavoriteSearchInteractor: FavoriteSearchInteractorInterface {
    
    func findAllFavoriteArtist( completion: @escaping ([ArtistObject]) -> Void) {
        
        let realm = try! Realm()
        let artists = realm.objects(ArtistObject.self).sorted(byKeyPath: "artistName")
        
        completion(Array(artists))
    }
    
}
