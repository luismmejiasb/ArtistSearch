//
//  TestExtensions.swift
//  ArtistSearchTests
//
//  Created by Luis Mejías on 5/22/19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import Foundation
import XCTest

func loadViewController(_ viewController: UIViewController) {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.makeKeyAndVisible()
    window.rootViewController = viewController
    _ = viewController.view
}

@discardableResult
func embedInNavigationController(_ viewController: UIViewController) -> UINavigationController {
    let navigationController = UINavigationController()
    navigationController.viewControllers = [viewController]
    _ = viewController.view
    loadViewController(navigationController)
    return navigationController
}

func createImage(_ size: CGSize) -> UIImage? {
    let rect = CGRect(origin: .zero, size: size)
    UIGraphicsBeginImageContext(size)
    guard let context = UIGraphicsGetCurrentContext() else { return nil }
    context.setFillColor(UIColor.red.cgColor)
    context.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
}

extension URL {
    static func mockImageURL() -> URL {
        return Bundle.main.url(forResource: "MockImage", withExtension: "png")!
    }
}

