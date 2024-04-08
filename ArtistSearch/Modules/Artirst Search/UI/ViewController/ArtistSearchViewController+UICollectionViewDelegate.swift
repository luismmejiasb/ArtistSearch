import UIKit

extension ArtistSearchViewController: UICollectionViewDelegate {
    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !searchData.isEmpty && searchData.indices.contains(indexPath.row) {
            presenter?.presentArtistDetail(searchData[indexPath.row])
        }
    }
}
