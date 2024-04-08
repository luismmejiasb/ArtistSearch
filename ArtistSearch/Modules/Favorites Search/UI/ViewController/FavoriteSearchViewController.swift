import RealmSwift
import UIKit

final class FavoriteSearchViewController: UIViewController, FavoriteSearchViewProtocol {
    @IBOutlet var favoriteSearchCollectionView: UICollectionView! {
        didSet {
            favoriteSearchCollectionView.register(FavoriteSearchCollectionViewCell.nib, forCellWithReuseIdentifier: FavoriteSearchCollectionViewCell.reusableIdentifier)
        }
    }

    @IBOutlet var informationView: UIStackView!
    @IBOutlet var searchInformationImageView: UIImageView!
    @IBOutlet var searchInformationLabel: UILabel!
    var presenter: FavoriteSearchPresenter!
    var favoriteArtistData: [ArtistObject]! = [] {
        didSet {
            favoriteSearchCollectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

        favoriteSearchCollectionView.delegate = self
        favoriteSearchCollectionView.dataSource = self

        setUpUI()
    }

    override func viewWillAppear(_: Bool) {
        super.viewWillAppear(true)
        presenter.presentFavoriteSearchs()
    }

    func setUpUI() {
        title = "Favorite Searchs"
        view.backgroundColor = GColors.darkTintColor
        showInformationView(true)
    }

    func showInformationView(_ withState: Bool) {
        informationView.isHidden = !withState
        searchInformationLabel.text = NSLocalizedString("no_favorite_artist_message", comment: "")
        searchInformationImageView.image = #imageLiteral(resourceName: "noFavoriteIcon")
    }

    func reloadDataInView(with artistData: [ArtistObject]) {
        favoriteArtistData = artistData

        if favoriteArtistData.isEmpty {
            showInformationView(true)
            favoriteSearchCollectionView.isHidden = true
        } else {
            showInformationView(false)
            favoriteSearchCollectionView.isHidden = false
        }
    }
}
