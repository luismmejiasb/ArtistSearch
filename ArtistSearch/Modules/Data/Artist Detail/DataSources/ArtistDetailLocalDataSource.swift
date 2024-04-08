import Combine
import RealmSwift

class ArtistDetailLocalDataSource: ArtistDetailLocalDataSourceProtocol {
    func saveArtist(_ artist: Artist) -> Future<Bool, Error> {
        return Future { promise in
            let artistToSave = ArtistObject()
            artistToSave.artistId = artist.artistId
            artistToSave.primaryGenreName = artist.primaryGenreName
            artistToSave.wrapperType = artist.wrapperType
            artistToSave.artistName = artist.artistName
            artistToSave.artistType = artist.artistType
            artistToSave.artistLinkUrl = artist.artistLinkUrl
            artistToSave.primaryGenreId = artist.primaryGenreId

            // swiftlint:disable force_try
            let realm = try! Realm()

            try! realm.write {
                realm.add(artistToSave)
            }

            return promise(.success(true))
        }
    }

    func deleteArtist(_ artist: Artist) -> Future<Bool, Error> {
        return Future { promise in
            let realm = try! Realm()

            guard let artist = realm.objects(ArtistObject.self).filter("artistId == %@", artist.artistId).first else {
                return promise(.failure(CloudSourceErrors.objectNotFound))
            }

            try! realm.write {
                realm.delete(artist)
            }

            return promise(.success(true))
        }
    }

    func isFavorite(_ artist: Artist) -> Bool {
        let realm = try! Realm()
        let artistResult = realm.objects(ArtistObject.self).filter("artistId == %@", artist.artistId)
        return !artistResult.isEmpty
    }
}
