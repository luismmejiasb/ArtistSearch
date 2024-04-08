import UIKit

public enum GColors {
    static let blackTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static let darkTintColor = #colorLiteral(red: 0.08276451379, green: 0, blue: 0.2638674974, alpha: 1)
    static let normalTintColor = #colorLiteral(red: 0.01826767251, green: 0.1066095904, blue: 0.5383259058, alpha: 1)
    static let extraLightTintColor = #colorLiteral(red: 0, green: 0.9921568627, blue: 1, alpha: 1)
    static let lightTintColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
    static let textColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    static let clearColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
}

extension UIView {
    static var nib: UINib {
        return UINib(nibName: nameOfClass, bundle: Bundle.main)
    }
}

extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension UINavigationController {
    func setUpNavigationController() {
        navigationBar.barTintColor = GColors.darkTintColor
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: GColors.textColor]
        navigationBar.backItem?.titleView?.tintColor = GColors.lightTintColor
        navigationBar.prefersLargeTitles = true
        navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: GColors.textColor]
    }
}

public enum ArtistSearchAI: String {
    case collectionView = "ArtistSearch.collectionView"
    case serachBar = "ArtistSearch.serachBar"
    case informationView = "ArtistSearch.informationView"
    case informationLabel = "ArtistSearch.informationLabel"
    case favoriteButton = "ArtistSearch.favoriteButton"
}
