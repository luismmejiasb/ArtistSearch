import Combine
import RealmSwift

protocol FavoriteSearchRepositoryProtocol {
    var localDataSource: FavoriteSearchLocalDataSourceProtocol { get }

    func fetchAllFavoriteArtist() -> Future<[ArtistObject], Error>
}

protocol FavoriteSearchLocalDataSourceProtocol {
    func fetchAllFavoriteArtist() -> Future<[ArtistObject], Error>
}
