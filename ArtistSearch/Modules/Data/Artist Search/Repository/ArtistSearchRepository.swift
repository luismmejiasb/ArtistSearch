import Combine

class ArtistSearchRepository: ArtistSearchRepositoryProtocol {
    var cloudDataSource: ArtistSearchCloudDataSourceProtocol
    
    init(cloudDataSource: ArtistSearchCloudDataSourceProtocol) {
        self.cloudDataSource = cloudDataSource
    }
    
    func searchArtist(withFilteringType filterType : FilteringType, and termString: String) -> Future<[Artist], Error> {
        return cloudDataSource.searchArtist(withFilteringType: filterType, and: termString)
    }
}
