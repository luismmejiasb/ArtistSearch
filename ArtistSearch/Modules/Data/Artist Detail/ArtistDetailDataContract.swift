import Combine
import RealmSwift

protocol ArtistDetailRepositoryProtocol {
    var localDataSource: ArtistDetailLocalDataSourceProtocol { get }

    func saveArtist(_ artist: Artist) -> Future<Bool, Error>
    func deleteArtist(_ artist: Artist) -> Future<Bool, Error>
    func isFavorite(_ artist: Artist) -> Bool
}

protocol ArtistDetailLocalDataSourceProtocol {
    func saveArtist(_ artist: Artist) -> Future<Bool, Error>
    func deleteArtist(_ artist: Artist) -> Future<Bool, Error>
    func isFavorite(_ artist: Artist) -> Bool
}
