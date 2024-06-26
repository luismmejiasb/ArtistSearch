import UIKit

class ArtistDetailViewController: UIViewController {
    @IBOutlet var favoriteSetterButton: UIButton!
    @IBOutlet var buttonSetterImageView: UIImageView!
    @IBOutlet var genderLabel: UILabel!
    var presenter: ArtistDetailPresenterProtocol?
    var isFavorite: Bool = false
    private lazy var favoriteButton: UIBarButtonItem = {
        let favoriteButton = UIBarButtonItem(image: UIImage(named: "favoriteIcon"), style: .plain, target: self, action: #selector(favoriteArtistInformation))
        return favoriteButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()

        presenter?.viewDidLoad()
        presenter?.displaySelectedArtistInformation(self)
        presenter?.validateFavoriteArtist()
    }

    @IBAction func favoriteArtistInformation(_: Any) {
        presenter?.showFavoriteInformation()
    }

    @IBAction func seeArtistItunesProfile(_: Any) {
        presenter?.showItunesProfile()
    }

    @IBAction func changeFavoriteState(_: Any) {
        if !isFavorite {
            presenter?.markFavoriteArtist()
        } else {
            presenter?.unmarkFavoriteArtist()
        }
    }

    func setUpUI() {
        view.backgroundColor = GColors.darkTintColor
        navigationItem.setRightBarButtonItems([favoriteButton], animated: true)
        favoriteSetterButton.backgroundColor = GColors.normalTintColor
    }
}

// MARK: - Extensions

extension ArtistDetailViewController: ArtistDetailViewProtocol {
    func setFavoriteState(_ state: Bool) {
        let titleMarkArtist = NSLocalizedString("mark_favorite_artist_button_title", comment: "")
        let titleUnMarkArtist = NSLocalizedString("unmark_favorite_artist_button_title", comment: "")

        isFavorite = state
        favoriteButton.image = !isFavorite ? nil : #imageLiteral(resourceName: "favoriteIcon")
        buttonSetterImageView.image = !isFavorite ? #imageLiteral(resourceName: "favoriteIcon") : nil

        favoriteSetterButton.setTitle(!isFavorite ? titleMarkArtist : titleUnMarkArtist, for: .normal)
    }
}
