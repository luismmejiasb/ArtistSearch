import Combine

protocol ArtistSearchRepositoryProtocol {
    var cloudDataSource: ArtistSearchCloudDataSourceProtocol { get }
    
    func searchArtist(withFilteringType filterType : FilteringType, and termString: String) -> Future<[Artist], Error>
}

protocol ArtistSearchCloudDataSourceProtocol {
    func searchArtist(withFilteringType filterType : FilteringType, and termString: String) -> Future<[Artist], Error>
}
