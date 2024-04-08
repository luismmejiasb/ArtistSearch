//
//  ArtistDetailViewController.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/21/19.
//  Copyright (c) 2019 Luis Mejías. All rights reserved.
//
//

import UIKit

final class ArtistDetailViewController: UIViewController {
    // MARK: - Public properties

    var presenter: ArtistDetailPresenterInterface!
    var isFavorite: Bool = false

    // MARK: - IBOutlets

    @IBOutlet var favoriteIndicatorButton: UIBarButtonItem!
    @IBOutlet var favoriteSetterButton: UIButton!
    @IBOutlet var buttonSetterImageView: UIImageView!
    @IBOutlet var genderLabel: UILabel!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()

        presenter.displaySelectedArtistInformation(self)

        presenter.validateFavoriteArtist()
    }

    @IBAction func favoriteArtistInformation(_: Any) {
        presenter.showFavoriteInformation(self)
    }

    @IBAction func seeArtistItunesProfile(_: Any) {
        presenter.showItunesProfileFrom()
    }

    @IBAction func changeFavoriteState(_: Any) {
        if !isFavorite {
            presenter.markFavoriteArtist()
        } else {
            presenter.unmarkFavoriteArtist()
        }
    }

    func setUpUI() {
        view.backgroundColor = GColors.darkTintColor
    }
}

// MARK: - Extensions -

extension ArtistDetailViewController: ArtistDetailViewInterface {
    func setFavoriteState(_ state: Bool) {
        let titleMarkArtist = NSLocalizedString("mark_favorite_artist_button_title", comment: "")
        let titleUnMarkArtist = NSLocalizedString("unmark_favorite_artist_button_title", comment: "")

        isFavorite = state
        favoriteIndicatorButton.image = !isFavorite ? nil : #imageLiteral(resourceName: "favoriteIcon")
        buttonSetterImageView.image = !isFavorite ? #imageLiteral(resourceName: "favoriteIcon") : nil

        favoriteSetterButton.setTitle(!isFavorite ? titleMarkArtist : titleUnMarkArtist, for: .normal)
    }
}
