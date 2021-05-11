import UIKit
import RealmSwift

class FavoriteSearchViewController: UIViewController {
    @IBOutlet weak var favoriteSearchCollectionView: UICollectionView! {
        didSet {
            favoriteSearchCollectionView.register(FavoriteSearchCollectionViewCell.nib, forCellWithReuseIdentifier: FavoriteSearchCollectionViewCell.reusableIdentifier)
        }
    }
    @IBOutlet weak var informationView: UIStackView!
    @IBOutlet weak var searchInformationImageView: UIImageView!
    @IBOutlet weak var searchInformationLabel: UILabel!
    var presenter: FavoriteSearchPresenter!
    var favoriteArtistData: [ArtistObject]! = [] {
        didSet {
            favoriteSearchCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteSearchCollectionView.delegate = self
        favoriteSearchCollectionView.dataSource = self
        
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.presentFavoriteSearchs()
    }
    
    func setUpUI() {
        self.view.backgroundColor = GColors.darkTintColor
        showInformationView(true)
        self.title = "Favorite Searchs"
    }
    
    func showInformationView(_ withState : Bool) {
        informationView.isHidden = !withState
        searchInformationLabel.text = NSLocalizedString("no_favorite_artist_message", comment: "")
        searchInformationImageView.image = #imageLiteral(resourceName: "noFavoriteIcon")
    }
}

// MARK: - Extensions

extension FavoriteSearchViewController: FavoriteSearchViewProtocol {
    
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

// MARK: - UICollectionViewDelegate methods

extension FavoriteSearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !favoriteArtistData.isEmpty, let selectedArtist: ArtistObject = favoriteArtistData?[indexPath.row] {
            
            let artist: Artist = Artist.init(artistId: selectedArtist.artistId, 
                                             primaryGenreName: selectedArtist.primaryGenreName, 
                                             wrapperType: selectedArtist.wrapperType, 
                                             artistName: selectedArtist.artistName, 
                                             artistType: selectedArtist.artistType, 
                                             artistLinkUrl: selectedArtist.artistLinkUrl, 
                                             primaryGenreId: selectedArtist.primaryGenreId)
            presenter?.presentArtistDetail(artist)
        }
    }
}

// MARK: - UICollectionViewDataSource methods

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

// MARK: - UICollectionViewDelegateFlowLayout methods

extension FavoriteSearchViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = collectionView.bounds.width / 2 - 4
        let height: CGFloat = 60.0
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout, 
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout, 
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout, 
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
