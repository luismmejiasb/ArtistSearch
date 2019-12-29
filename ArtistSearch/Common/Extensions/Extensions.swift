//
//  Extensions.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>(ofType _: T.Type, withIdentifier identifier: String? = nil) -> T {
        // swiftlint:disable force_cast
        let identifier = identifier ?? String(describing: T.self)
        return instantiateViewController(withIdentifier: identifier) as! T
    }
    
}

extension UIViewController {
    
    func setGradientBackground() {
        let topColor =  GColors.darkTintColor.cgColor
        let bottomColor = GColors.normalTintColor.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor, bottomColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
}

public struct GColors {
    static let darkTintColor       = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
    static let normalTintColor     = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
    static let extraLightTintColor = #colorLiteral(red: 0, green: 0.9921568627, blue: 1, alpha: 1)
    static let lightTintColor      = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
    static let textColor           = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    static let clearColor          = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
}

/*extension UIStoryboard {
    
    class func artistSearchStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "ArtistSearch", bundle: .main)
    }
    
    class func artistDetailStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "ArtistDetail", bundle: .main)
    }
    
    class func favoriteSearchStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "FavoriteSearch", bundle: .main)
    }

    class func artistSearchNavigationController() -> ArtistNavigationController {
        return UIStoryboard.artistSearchStoryBoard().instantiateInitialViewController() as? ArtistNavigationController ?? ArtistNavigationController()
    }
    
    class func artistSearchViewController() -> ArtistSearchViewController {
        return UIStoryboard.artistSearchStoryBoard().instantiateInitialViewController() as? ArtistSearchViewController ?? ArtistSearchViewController()
    }
    
    class func artistDetailViewController() -> ArtistDetailViewController {
        return UIStoryboard.artistDetailStoryBoard().instantiateInitialViewController() as? ArtistDetailViewController ?? ArtistDetailViewController()
    }
    
    class func favoriteArtistViewController() -> FavoriteSearchViewController {
        return UIStoryboard.favoriteSearchStoryBoard().instantiateInitialViewController() as? FavoriteSearchViewController ?? FavoriteSearchViewController()
    }

}*/

public enum ArtistSearchAI: String {
    case collectionView = "ArtistSearch.collectionView", serachBar = "ArtistSearch.serachBar", informationView = "ArtistSearch.informationView", informationLabel = "ArtistSearch.informationLabel", favoriteButton = "ArtistSearch.favoriteButton"
}
