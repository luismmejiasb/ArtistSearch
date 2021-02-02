import Foundation
import RealmSwift

final class ArtistDetailInteractor {
}

// MARK: - Extensions -

extension ArtistDetailInteractor: ArtistDetailInteractorProtocol {
    
    func saveArtist(_ artist: Artist, completion: @escaping (Bool) -> Void) {
        
        let selectedArtistObject: ArtistObject = ArtistObject()
        selectedArtistObject.artistId = artist.artistId
        selectedArtistObject.primaryGenreName = artist.primaryGenreName
        selectedArtistObject.wrapperType = artist.wrapperType
        selectedArtistObject.artistName = artist.artistName
        selectedArtistObject.artistType = artist.artistType
        selectedArtistObject.artistLinkUrl = artist.artistLinkUrl
        selectedArtistObject.primaryGenreId = artist.primaryGenreId
        // swiftlint:disable force_try
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(selectedArtistObject)
            completion(true)
        }
        
        completion(false)
    }
    
    func deleteArtist(_ artist: Artist, completion: @escaping (Bool) -> Void) {
        let realm = try! Realm()
        
        guard let artist = realm.objects(ArtistObject.self).filter("artistId == %@", artist.artistId).first else {
            completion(false)
            return
        }
        
        try! realm.write {
            realm.delete(artist)
            completion(true)
        }
        
        completion(false)
        
    }
    
    func isFavorite(_ artist : Artist) -> Bool {
        let realm = try! Realm()
        let artistResult = realm.objects(ArtistObject.self).filter("artistId == %@", artist.artistId)
        return !artistResult.isEmpty
    }
}
