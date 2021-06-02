import UIKit

extension FavoriteSearchViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteArtistData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: ArtistCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteSearchCollectionViewCell.reusableIdentifier,
                                                                                      for: indexPath) as? ArtistCollectionViewCell else {
                                                                                        return UICollectionViewCell()
        }
        
        let artistObject: ArtistObject = favoriteArtistData[indexPath.row]
        
        let artist: Artist = Artist.init(artistId: artistObject.artistId,
                                         primaryGenreName: artistObject.primaryGenreName,
                                         wrapperType: artistObject.wrapperType,
                                         artistName: artistObject.artistName,
                                         artistType: artistObject.artistType,
                                         artistLinkUrl: artistObject.artistLinkUrl,
                                         primaryGenreId: artistObject.primaryGenreId)
        
        cell.configureCell(with: artist)
        
        return cell
    }
}
