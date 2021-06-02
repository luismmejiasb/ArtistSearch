import UIKit

extension FavoriteSearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !favoriteArtistData.isEmpty, let selectedArtist: ArtistObject = favoriteArtistData?[indexPath.row] {
            
            let artist: Artist = Artist.init(artistId: selectedArtist.artistId,
                                             primaryGenreName: selectedArtist.primaryGenreName,
                                             wrapperType: selectedArtist.wrapperType,
                                             artistName: selectedArtist.artistName,
                                             artistType: selectedArtist.artistType,
                                             artistLinkUrl: selectedArtist.artistLinkUrl,
                                             primaryGenreId: selectedArtist.primaryGenreId)
            presenter?.presentArtistDetail(artist)
        }
    }
}
