import Foundation
import UIKit

class FavoriteSearchCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var artistNameLabel: UILabel!
    static let reusableIdentifier = "artistCollectionCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func configureCell(with artistData: Artist) {
        artistNameLabel.text = artistData.artistName
        artistNameLabel.textColor = GColors.textColor
    }

    private func setupUI() {
        layer.cornerRadius = 5
        layer.borderWidth = 0.5
        layer.backgroundColor = GColors.clearColor.cgColor
        layer.borderColor = GColors.textColor.cgColor
    }
}
