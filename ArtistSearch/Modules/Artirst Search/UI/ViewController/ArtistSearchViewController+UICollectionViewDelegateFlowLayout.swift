import UIKit

extension ArtistSearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.bounds.width / 2 - 4
        let height: CGFloat = 60.0

        return CGSize(width: width, height: height)
    }

    func collectionView(_: UICollectionView,
                        layout _: UICollectionViewLayout,
                        insetForSectionAt _: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets.zero
    }

    func collectionView(_: UICollectionView,
                        layout _: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt _: Int) -> CGFloat
    {
        return 2
    }

    func collectionView(_: UICollectionView,
                        layout _: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt _: Int) -> CGFloat
    {
        return 10
    }
}
