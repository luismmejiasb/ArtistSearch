//
//  MainUITest.swift
//  ArtistSearchUITests
//
//  Created by Luis Mejías on 8/30/19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import XCTest
import Foundation

class MainUITest: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
    }

    func setupApp() {
        app = XCUIApplication()
        app.launchArguments += ProcessInfo().arguments
        XCUIDevice.shared.orientation = .portrait
    }
}
