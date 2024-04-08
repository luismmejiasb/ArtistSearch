import Foundation
import UIKit

class ArtistSearchMockWireFrame: ArtistSearchWireframeInterface {
    func popFromNavigationController(animated _: Bool) {}

    func dismiss(animated _: Bool) {}

    func showErrorAlert(with _: String?) {}

    func showAlert(with _: String?, message _: String?) {}

    func showAlert(with _: String?, message _: String?, actions _: [UIAlertAction]) {}

    func handdleHTTPError(withErrorCode _: Int) {}
}
