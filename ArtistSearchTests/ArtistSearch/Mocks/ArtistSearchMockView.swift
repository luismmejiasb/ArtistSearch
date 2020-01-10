class ArtistSearchMockView: ArtistSearchViewInterface {
    
    var viewReloaded = false
    
    func reloadDataInView(with artistsData: [Artist]) {
        viewReloaded = true
    }
}
