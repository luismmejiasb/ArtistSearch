//
//  FavoriteSearchViewController.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit
import RealmSwift

final class FavoriteSearchViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var favoriteSearchCollectionView: UICollectionView!
    @IBOutlet weak var informationView: UIStackView!
    @IBOutlet weak var searchInformationImageView: UIImageView!
    @IBOutlet weak var searchInformationLabel: UILabel!
    
    // MARK: - Public properties
    var presenter: FavoriteSearchPresenter!
    var favoriteArtistData: [ArtistObject]! = []
    
    // MARK: - Lifecycle -
    
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
        setGradientBackground()
        showInformationView(true)
    }
    
    func showInformationView(_ withState : Bool) {
        informationView.isHidden = !withState
        searchInformationLabel.text = NSLocalizedString("no_favorite_artist_message", comment: "")
        searchInformationImageView.image = #imageLiteral(resourceName: "noFavoriteIcon")
        
    }
}

// MARK: - Extensions

extension FavoriteSearchViewController: FavoriteSearchViewInterface {
    
    func reloadDataInView(with artistData: [ArtistObject]) {
        favoriteArtistData = artistData
        
        if favoriteArtistData.isEmpty {
            showInformationView(true)
            favoriteSearchCollectionView.isHidden = true
        } else {
            showInformationView(false)
            favoriteSearchCollectionView.isHidden = false
        }
        
        UIView.transition(with: favoriteSearchCollectionView, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.favoriteSearchCollectionView.reloadData()
        }, completion: nil)
    }
}

// MARK: - UICollectionViewDelegate methods

extension FavoriteSearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if favoriteArtistData.isEmpty {
            
            if let selectedArtist: ArtistObject = favoriteArtistData?[indexPath.row] {
                
                let artist: Artist = Artist.init(artistId: selectedArtist.artistId, 
                                                 primaryGenreName: selectedArtist.primaryGenreName, 
                                                 wrapperType: selectedArtist.wrapperType, 
                                                 artistName: selectedArtist.artistName, 
                                                 artistType: selectedArtist.artistType, 
                                                 artistLinkUrl: selectedArtist.artistLinkUrl, 
                                                 primaryGenreId: selectedArtist.primaryGenreId)
                
                let artistDetailWireframe: ArtistDetailWireframe = ArtistDetailWireframe.init(selectedArtist: artist)
                navigationController?.pushWireframe(artistDetailWireframe)
            }
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
        guard let cell: ArtistCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "artistCollectionCell", 
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
