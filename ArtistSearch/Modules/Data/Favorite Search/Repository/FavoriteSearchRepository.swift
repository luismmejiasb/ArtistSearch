import Combine

class FavoriteSearchRepository: FavoriteSearchRepositoryProtocol {
    var localDataSource: FavoriteSearchLocalDataSourceProtocol
    
    init(localDataSource: FavoriteSearchLocalDataSourceProtocol) {
        self.localDataSource = localDataSource
    }
    
    func fetchAllFavoriteArtist() -> Future<[ArtistObject], Error> {
        return localDataSource.fetchAllFavoriteArtist()
    }
}
