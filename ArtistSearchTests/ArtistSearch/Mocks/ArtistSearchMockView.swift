class ArtistSearchMockView: ArtistSearchViewInterface {
    var viewReloaded = false

    func reloadDataInView(with _: [Artist]) {
        viewReloaded = true
    }
}
