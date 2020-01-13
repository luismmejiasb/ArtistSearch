//
//  AppDelegate.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let initialViewController = ArtistSearchWireframe.assemble()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }
 
    func applicationWillTerminate(_ application: UIApplication) {
    }
}
