import RealmSwift

class FavoriteSearchInteractor: FavoriteSearchInteractorProtocol {
    
    func findAllFavoriteArtist( completion: @escaping ([ArtistObject]) -> Void) {
        // swiftlint:disable force_try
        let realm = try! Realm()
        let artists = realm.objects(ArtistObject.self).sorted(byKeyPath: "artistName")
        
        completion(Array(artists))
    }
    
}
