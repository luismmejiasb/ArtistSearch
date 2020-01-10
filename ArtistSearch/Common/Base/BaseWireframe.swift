import UIKit
import SafariServices

protocol WireframeInterface: class {
    func popFromNavigationController(animated: Bool)
    func dismiss(animated: Bool)
    func showErrorAlert(with message: String?)
    func showAlert(with title: String?, message: String?)
    func showAlert(with title: String?, message: String?, actions: [UIAlertAction])
    func handdleHTTPError(withErrorCode errorCode : Int)
}

class BaseWireframe {

    fileprivate unowned var _viewController: UIViewController
    
    //to retain view controller reference upon first access
    fileprivate var _temporaryStoredViewController: UIViewController?
    
    init(viewController: UIViewController) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
    }
}

extension BaseWireframe: WireframeInterface {
    // swiftlint:disable redundant_discardable_let
    func popFromNavigationController(animated: Bool) {
        let _ = navigationController?.popViewController(animated: animated)
    }
    
    func dismiss(animated: Bool) {
        navigationController?.dismiss(animated: animated)
    }

    func showErrorAlert(with message: String?) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(with: NSLocalizedString("generic_error", comment: ""), message: message, actions: [okAction])
    }

    func showAlert(with title: String?, message: String?) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(with: title, message: message, actions: [okAction])
    }
    
    func showAlert(with title: String?, message: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        navigationController?.present(alert, animated: true, completion: nil)
    }

    // swiftlint:disable cyclomatic_complexity
    // swiftlint:disable function_body_length
    func handdleHTTPError(withErrorCode errorCode : Int) {
        
        switch errorCode {
            
        case NSURLErrorUnknown:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("unkown_error", comment: ""))
            
        case NSURLErrorCancelled:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("operation_canceled", comment: ""))
            
        case NSURLErrorBadURL:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("unkown_error", comment: ""))
            
        case NSURLErrorTimedOut:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("timed_out", comment: ""))
            
        case NSURLErrorUnsupportedURL:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("service_url_unsupported", comment: ""))
            
        case NSURLErrorCannotFindHost:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("problem_with_host", comment: ""))
            
        case NSURLErrorCannotConnectToHost:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("problem_with_host", comment: ""))
            
        case NSURLErrorNetworkConnectionLost:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("connection_lost", comment: ""))
            
        case NSURLErrorDNSLookupFailed:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("timed_out", comment: ""))
            
        case NSURLErrorHTTPTooManyRedirects:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("timed_out", comment: ""))
            
        case NSURLErrorResourceUnavailable:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("timed_out", comment: ""))
            
        case NSURLErrorNotConnectedToInternet:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("timed_out", comment: ""))
            
        case NSURLErrorRedirectToNonExistentLocation:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("timed_out", comment: ""))
            
        case NSURLErrorBadServerResponse:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
        case NSURLErrorUserCancelledAuthentication:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("authentication", comment: ""))
            
        case NSURLErrorUserAuthenticationRequired:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("authentication", comment: ""))
            
        case NSURLErrorZeroByteResource:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("no_information", comment: ""))
            
        case NSURLErrorCannotDecodeRawData:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("incompatible_information", comment: ""))
            
        case NSURLErrorCannotDecodeContentData:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("incompatible_information", comment: ""))
            
        case NSURLErrorCannotParseResponse:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("incompatible_information", comment: ""))
            
        case NSURLErrorAppTransportSecurityRequiresSecureConnection:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("security_error", comment: ""))
            
        case NSURLErrorFileDoesNotExist:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("non-existent_service", comment: ""))
            
        case NSURLErrorNoPermissionsToReadFile:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("no_permissions", comment: ""))
            
        case NSURLErrorDataLengthExceedsMaximum:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("very_large_response", comment: ""))
            
        // SSL errors
        case NSURLErrorSecureConnectionFailed:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))

        case NSURLErrorServerCertificateHasBadDate:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
        case NSURLErrorServerCertificateUntrusted:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
        case NSURLErrorServerCertificateHasUnknownRoot:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
        case NSURLErrorServerCertificateNotYetValid:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
        case NSURLErrorClientCertificateRejected:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
        case NSURLErrorClientCertificateRequired:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
        case NSURLErrorCannotLoadFromNetwork:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
        default:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: "unkown_problem")
        }
    }
}

extension BaseWireframe {
    
    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
    
}

extension UIViewController {
    
    func presentWireframe(_ wireframe: BaseWireframe, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }
    
    func presentWireframeModally(_ wireframe: BaseWireframe, animated: Bool = true, completion: (() -> Void)? = nil) {
        wireframe.viewController.view.backgroundColor = .clear
        wireframe.viewController.modalPresentationStyle = .overCurrentContext
        present(wireframe.viewController, animated: animated, completion: completion)
    }
    
}

extension UINavigationController {
    
    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        pushViewController(wireframe.viewController, animated: animated)
    }
    
    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        setViewControllers([wireframe.viewController], animated: animated)
    }
    
}
