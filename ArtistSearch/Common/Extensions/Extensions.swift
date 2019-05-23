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


extension UIStoryboard {
    
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
        let navigationController: ArtistNavigationController! = UIStoryboard.artistSearchStoryBoard().instantiateInitialViewController() as? ArtistNavigationController
        return navigationController
    }
    
    /*class func prospectorFollowUpViewController() -> UINavigationController {
        let viewController: UINavigationController! = UIStoryboard.prospectorFollowUpStoryboard().instantiateInitialViewController() as? UINavigationController
        return viewController
    }
    
    class func prospectorHotContactsViewController() -> UINavigationController {
        let viewController: UINavigationController! = UIStoryboard.prospectorHotContactsStoryboard().instantiateInitialViewController() as? UINavigationController
        return viewController
    }
    
    class func prospectorWhyViewController() -> UIViewController {
        var viewController: ProspectorWhyViewController!
        
        viewController = UIStoryboard.prospectorWhyStoryboard().instantiateInitialViewController() as? ProspectorWhyViewController
        return viewController
    }
    
    class func prospectorImportContactsViewController() -> UIViewController {
        var viewController: UINavigationController!
        
        viewController = UIStoryboard.prospectorImportContactsStoryboard().instantiateInitialViewController() as? UINavigationController
        return viewController
    }
    
    
    class func prospectorResourceViewController() -> UINavigationController {
        let navController: UINavigationController! = UIStoryboard.prospectorResourceStoryboard().instantiateInitialViewController() as? UINavigationController
        return navController
    }
    
    class func resourcePreviewViewController() -> ResourcePreviewViewController {
        let viewController: ResourcePreviewViewController! = UIStoryboard.ProspectorResourcePreviewStoryboard().instantiateInitialViewController() as? ResourcePreviewViewController
        return viewController
    }*/
    
}
