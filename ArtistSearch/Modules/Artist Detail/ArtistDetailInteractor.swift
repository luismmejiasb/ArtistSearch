//
//  ArtistDetailInteractor.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/21/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import Foundation
import RealmSwift

final class ArtistDetailInteractor {
}

// MARK: - Extensions -

extension ArtistDetailInteractor: ArtistDetailInteractorInterface {
    
    func saveArtist(_ artist: Artist, completion: @escaping (Bool) -> Void) {
        
        let selectedArtistObject: ArtistObject = ArtistObject()
        selectedArtistObject.artistId = artist.artistId
        selectedArtistObject.primaryGenreName = artist.primaryGenreName
        selectedArtistObject.wrapperType = artist.wrapperType
        selectedArtistObject.artistName = artist.artistName
        selectedArtistObject.artistType = artist.artistType
        selectedArtistObject.artistLinkUrl = artist.artistLinkUrl
        selectedArtistObject.primaryGenreId = artist.primaryGenreId
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(selectedArtistObject)
            completion(true)
        }
        
        completion(false)
    }
    
    func deleteArtist(_ artist: Artist, completion: @escaping (Bool) -> Void) {
        let realm = try! Realm()
        
        let artist = realm.objects(ArtistObject.self).filter("artistId == %@", artist.artistId).first
        
        try! realm.write {
            realm.delete(artist!)
            completion(true)
        }
        
        completion(false)
        
    }
    
    func consultIfFavoriteArtist(_ artist : Artist) -> Bool {
        
        let realm = try! Realm()
        
        let artistResult = realm.objects(ArtistObject.self).filter("artistId == %@", artist.artistId)
        
        return artistResult.count != 0
        
    }
}
