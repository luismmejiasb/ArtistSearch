import Combine

class ArtistDetailRepository: ArtistDetailRepositoryProtocol {
    var localDataSource: ArtistDetailLocalDataSourceProtocol
    
    init(localDataSource: ArtistDetailLocalDataSourceProtocol) {
        self.localDataSource = localDataSource
    }
    
    func saveArtist(_ artist: Artist) -> Future<Bool, Error> {
        return localDataSource.saveArtist(artist)
    }
    
    func deleteArtist(_ artist: Artist) -> Future<Bool, Error> {
        return localDataSource.deleteArtist(artist)
    }
    
    func isFavorite(_ artist: Artist) -> Bool {
        return localDataSource.isFavorite(artist)
    }

}
