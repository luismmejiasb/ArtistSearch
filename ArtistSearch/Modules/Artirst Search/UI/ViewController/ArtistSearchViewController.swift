import Combine
import UIKit

class ArtistSearchViewController: UIViewController, ArtistSearchViewProtocol {
    @IBOutlet var searchCollectionView: UICollectionView! {
        didSet {
            searchCollectionView.register(ArtistCollectionViewCell.nib, forCellWithReuseIdentifier: ArtistCollectionViewCell.reusableIdentifier)
        }
    }

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var searchInformationView: UIStackView!
    @IBOutlet var searchInformationImageView: UIImageView!
    @IBOutlet var searchInformationLabel: UILabel!
    private lazy var favoriteButton: UIBarButtonItem = {
        let favoriteButton = UIBarButtonItem(image: UIImage(named: "favoriteIcon"), style: .plain, target: self, action: #selector(showFavoriteSearchs))
        return favoriteButton
    }()

    var presenter: ArtistSearchPresenterProtocol?
    var searchData: [Artist] = [] {
        didSet {
            searchCollectionView.reloadData()
        }
    }

    var selectedFilterType: FilteringType = .artist
    var searchPublisher: PassthroughSubject<[Artist], Error>?
    private var tokens = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchBar.delegate = self
        setUpUI()
        presenter?.viewDidLoad()
    }

    override func viewDidAppear(_: Bool) {
        super.viewDidAppear(true)
        searchBar.becomeFirstResponder()
    }

    @IBAction func showFavoriteSearchs(_: Any) {
        presenter?.presentFavoriteSearchs()
    }

    func setUpUI() {
        view.backgroundColor = GColors.darkTintColor
        showInformationView(true, type: .defaultInformation)
        searchBar.setValue(NSLocalizedString("cancel_button_title", comment: ""), forKey: "cancelButtonText")
        searchBar.placeholder = NSLocalizedString("search_bar_placeholder_text", comment: "")
        navigationItem.setRightBarButtonItems([favoriteButton], animated: true)
        title = "Artist Search"
    }

    func showInformationView(_ withState: Bool, type: InformationType) {
        searchInformationView.isHidden = !withState
        searchInformationLabel.text = type.informationMessage
        searchInformationImageView.image = type.informationIcon
    }

    func setUpAccessibleIdentifiers() {
        searchCollectionView.accessibilityIdentifier = ArtistSearchAI.collectionView.rawValue
        searchBar.accessibilityIdentifier = ArtistSearchAI.serachBar.rawValue
        searchInformationView.accessibilityIdentifier = ArtistSearchAI.informationView.rawValue
        searchInformationLabel.accessibilityIdentifier = ArtistSearchAI.informationLabel.rawValue
        favoriteButton.accessibilityIdentifier = ArtistSearchAI.favoriteButton.rawValue
    }

    func reloadDataInView(with artistData: [Artist]) {
        searchData = artistData
        showInformationView(searchData.isEmpty, type: .noResults)
    }
}
