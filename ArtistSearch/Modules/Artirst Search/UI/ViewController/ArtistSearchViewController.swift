import Combine
import UIKit

final class ArtistSearchViewController: UIViewController, ArtistSearchViewProtocol {
    // MARK: - Properties

    @IBOutlet var searchCollectionView: UICollectionView! {
        didSet {
            searchCollectionView.register(
                ArtistCollectionViewCell.nib,
                forCellWithReuseIdentifier: ArtistCollectionViewCell.reusableIdentifier
            )
        }
    }

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var searchInformationView: UIStackView!
    @IBOutlet var searchInformationImageView: UIImageView!
    @IBOutlet var searchInformationLabel: UILabel!

    var presenter: ArtistSearchPresenterProtocol?
    var searchData: [Artist] = [] {
        didSet {
            searchCollectionView.reloadData()
        }
    }

    var selectedFilterType: FilteringType = .artist
    var searchPublisher: PassthroughSubject<[Artist], Error>?

    // Private
    private lazy var favoriteButton: UIBarButtonItem = {
        let favoriteButton = UIBarButtonItem(
            image: UIImage(named: "favoriteIcon"),
            style: .plain,
            target: self,
            action: #selector(showFavoriteSearchs)
        )
        return favoriteButton
    }()

    private var tokens = Set<AnyCancellable>()

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        setUpSearchBar()
        setUpUI()
        presenter?.viewDidLoad()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchBar.becomeFirstResponder()
    }

    // MARK: - Actions

    @IBAction func showFavoriteSearchs(_: Any) {
        presenter?.presentFavoriteSearchs()
    }

    // MARK: - UI Setup

    private func setUpUI() {
        title = "Artist Search"

        view.backgroundColor = GColors.darkTintColor

        showInformationView(true, type: .defaultInformation)

        searchBar.setValue(
            NSLocalizedString("cancel_button_title", comment: ""),
            forKey: "cancelButtonText"
        )

        searchBar.placeholder = NSLocalizedString(
            "search_bar_placeholder_text",
            comment: ""
        )

        navigationItem.setRightBarButtonItems(
            [favoriteButton],
            animated: true
        )
    }

    private func setUpCollectionView() {
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
    }

    private func setUpSearchBar() {
        searchBar.delegate = self
    }

    // MARK: - Helper Methods

    func showInformationView(_ withState: Bool, type: InformationType) {
        searchInformationView.isHidden = !withState
        searchInformationLabel.text = type.informationMessage
        searchInformationImageView.image = type.informationIcon
    }

    // MARK: - Accessibility

    func setUpAccessibleIdentifiers() {
        searchCollectionView.accessibilityIdentifier = ArtistSearchAI.collectionView.rawValue
        searchBar.accessibilityIdentifier = ArtistSearchAI.serachBar.rawValue
        searchInformationView.accessibilityIdentifier = ArtistSearchAI.informationView.rawValue
        searchInformationLabel.accessibilityIdentifier = ArtistSearchAI.informationLabel.rawValue
        favoriteButton.accessibilityIdentifier = ArtistSearchAI.favoriteButton.rawValue
    }

    // MARK: - Data Handling

    func reloadDataInView(with artistData: [Artist]) {
        searchData = artistData
        showInformationView(searchData.isEmpty, type: .noResults)
    }
}
