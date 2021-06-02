import Combine
import RealmSwift

class FavoriteSearchLocalDataSource: FavoriteSearchLocalDataSourceProtocol {
    func fetchAllFavoriteArtist() -> Future<[ArtistObject], Error> {
        return Future { promise in
            let realm = try! Realm()
            let artists = realm.objects(ArtistObject.self).sorted(byKeyPath: "artistName")

            promise(.success(Array(artists)))
        }
    }
}
