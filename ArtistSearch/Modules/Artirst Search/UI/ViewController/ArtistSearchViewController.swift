import UIKit
import Combine

class ArtistSearchViewController: UIViewController, ArtistSearchViewProtocol {
    @IBOutlet weak var searchCollectionView: UICollectionView! {
        didSet {
            searchCollectionView.register(ArtistCollectionViewCell.nib, forCellWithReuseIdentifier: ArtistCollectionViewCell.reusableIdentifier)
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchInformationView: UIStackView!
    @IBOutlet weak var searchInformationImageView: UIImageView!
    @IBOutlet weak var searchInformationLabel: UILabel!
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        searchBar.becomeFirstResponder()
    }

    @IBAction func showFavoriteSearchs(_ sender: Any) {
        presenter?.presentFavoriteSearchs()
    }
    
    func setUpUI() {
        self.view.backgroundColor = GColors.darkTintColor
        showInformationView(true, type: .defaultInformation)
        searchBar.setValue(NSLocalizedString("cancel_button_title", comment: ""), forKey: "cancelButtonText")
        searchBar.placeholder = NSLocalizedString("search_bar_placeholder_text", comment: "")
        self.navigationItem.setRightBarButtonItems([favoriteButton], animated: true)
        self.title = "Artist Search"
    }
    
    func showInformationView(_ withState : Bool, type: InformationType) {
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
        showInformationView(searchData.isEmpty , type: .noResults)
    }
}
