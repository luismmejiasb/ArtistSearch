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


    func handdleHTTPError(withErrorCode errorCode : Int) {
        
        switch errorCode {
            
        case NSURLErrorUnknown:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("unkown_error", comment: ""))
            
            break
            
        case NSURLErrorCancelled:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("operation_canceled", comment: ""))
            
            break
            
        case NSURLErrorBadURL:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("unkown_error", comment: ""))
            
            break
            
        case NSURLErrorTimedOut:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("timed_out", comment: ""))
            
            break
            
        case NSURLErrorUnsupportedURL:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("service_url_unsupported", comment: ""))
            
            break
            
        case NSURLErrorCannotFindHost:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("problem_with_host", comment: ""))
            
            break
            
        case NSURLErrorCannotConnectToHost:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("problem_with_host", comment: ""))
            
            break
            
        case NSURLErrorNetworkConnectionLost:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("connection_lost", comment: ""))
            
            break
            
        case NSURLErrorDNSLookupFailed:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("timed_out", comment: ""))
            
            break
            
        case NSURLErrorHTTPTooManyRedirects:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("timed_out", comment: ""))
            
            break
            
        case NSURLErrorResourceUnavailable:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("timed_out", comment: ""))
            
            break
            
        case NSURLErrorNotConnectedToInternet:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("timed_out", comment: ""))
            
            break
            
        case NSURLErrorRedirectToNonExistentLocation:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("timed_out", comment: ""))
            
            break
            
        case NSURLErrorBadServerResponse:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
            break
            
        case NSURLErrorUserCancelledAuthentication:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("authentication", comment: ""))
            
            break
            
        case NSURLErrorUserAuthenticationRequired:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("authentication", comment: ""))
            
            break
            
        case NSURLErrorZeroByteResource:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("no_information", comment: ""))
            
            break
            
        case NSURLErrorCannotDecodeRawData:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("incompatible_information", comment: ""))
            
            break
            
        case NSURLErrorCannotDecodeContentData:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("incompatible_information", comment: ""))
            
            break
            
        case NSURLErrorCannotParseResponse:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("incompatible_information", comment: ""))
            
            break
            
        case NSURLErrorAppTransportSecurityRequiresSecureConnection:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("security_error", comment: ""))
            
            break
            
        case NSURLErrorFileDoesNotExist:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("non-existent_service", comment: ""))
            
            break
            
        case NSURLErrorNoPermissionsToReadFile:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("no_permissions", comment: ""))
            
            break
            
        case NSURLErrorDataLengthExceedsMaximum:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("very_large_response", comment: ""))
            
            break
            
        // SSL errors
        case NSURLErrorSecureConnectionFailed:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            break
        case NSURLErrorServerCertificateHasBadDate:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
            break
            
        case NSURLErrorServerCertificateUntrusted:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
            break
            
        case NSURLErrorServerCertificateHasUnknownRoot:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
            break
            
        case NSURLErrorServerCertificateNotYetValid:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
            break
            
        case NSURLErrorClientCertificateRejected:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
            break
            
        case NSURLErrorClientCertificateRequired:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
            break
            
        case NSURLErrorCannotLoadFromNetwork:
            
            showAlert( with : NSLocalizedString("generic_error_title", comment: ""), message: NSLocalizedString("server_problem", comment: ""))
            
            break
            
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

