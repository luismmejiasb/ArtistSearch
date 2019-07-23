//
//  ArtistSearchViewController.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

final class ArtistSearchViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchInformationView: UIStackView!
    @IBOutlet weak var searchInformationImageView: UIImageView!
    @IBOutlet weak var searchInformationLabel: UILabel!
    
    // MARK: - Public properties
    var presenter: ArtistSearchPresenterInterface!
    var searchData: [Artist]! = []
    var selectedFilterType: FilteringType = .artist

    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchBar.delegate = self
        
        setUpUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        searchBar.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        if presenter != nil {
            presenter.cancelAPIRequest()
        }
    }
	
    @IBAction func showFavoriteSearchs(_ sender: Any) {
        navigationController?.pushWireframe(FavoriteSearchWireframe())
    }
    
    func setUpUI() {
        setGradientBackground()
        showInformationView(true, type: .defaultInformation)
        searchBar.setValue(NSLocalizedString("cancel_button_title", comment: ""), forKey: "cancelButtonText")
        searchBar.placeholder = NSLocalizedString("search_bar_placeholder_text", comment: "")
    }
    
    func showInformationView(_ withState : Bool, type: InformationType) {
        searchInformationView.isHidden = !withState
        searchInformationLabel.text = type.informationMessage
        searchInformationImageView.image = type.informationIcon
    }
}

// MARK: - Extensions

extension ArtistSearchViewController: ArtistSearchViewInterface {

    func reloadDataInView(with artistData: [Artist]) {
        searchData = artistData
        
        if searchData.isEmpty {
            showInformationView(true, type: .noResults)
        }
        
        UIView.transition(with: searchCollectionView, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.searchCollectionView.reloadData()
        }, completion: nil)
    }
}

// MARK: - UICollectionViewDelegate methods

extension ArtistSearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if searchData.isEmpty {
            if let selectedArtist: Artist = searchData?[indexPath.row] {
                let artistDetailWireframe: ArtistDetailWireframe = ArtistDetailWireframe.init(selectedArtist: selectedArtist)
                navigationController?.pushWireframe(artistDetailWireframe)
            }
        }
    }
}

// MARK: - UICollectionViewDataSource methods

extension ArtistSearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: ArtistCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "artistCollectionCell", 
                                                                                      for: indexPath) as? ArtistCollectionViewCell else {
                                                                                        return UICollectionViewCell()
        }
        
        let artist: Artist = searchData[indexPath.row]
        
        cell.configureCell(with: artist)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout methods

extension ArtistSearchViewController : UICollectionViewDelegateFlowLayout {
    
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

// MARK: - UISearchBarDelegate methods

extension ArtistSearchViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchData = []
        searchCollectionView.reloadData()
        searchCollectionView.isHidden = true
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        showInformationView(true, type: .defaultInformation)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text?.isEmpty ?? true {
            searchBar.resignFirstResponder()
            searchCollectionView.isHidden = false
            presenter.searchTerm(type: selectedFilterType, and: searchBar.text!)
            showInformationView(false, type: .defaultInformation)
        } else {
            searchData = []
            searchCollectionView.reloadData()
            searchCollectionView.isHidden = true
            showInformationView(true, type: .defaultInformation)
        }
    }
}
