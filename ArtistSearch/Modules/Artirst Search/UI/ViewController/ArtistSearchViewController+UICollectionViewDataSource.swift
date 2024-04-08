import UIKit

extension ArtistSearchViewController: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return searchData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: ArtistCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistCollectionViewCell.reusableIdentifier,
                                                                                      for: indexPath) as? ArtistCollectionViewCell
        else {
            return UICollectionViewCell()
        }

        let artist: Artist = searchData[indexPath.row]

        cell.configureCell(with: artist)

        return cell
    }
}
