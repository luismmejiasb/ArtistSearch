//   RootWireframeTests.swift
//  MovAppTests
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit
import XCTest
@testable import ArtistSearch

class RootWireframeTests: XCTestCase {
    
    var initialController: ArtistNavigationController! = ArtistNavigationController()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShowRootViewController() {
        
        initialController.setRootWireframe(ArtistSearchWireframe())
        
        XCTAssertTrue(initialController.viewControllers[0] is ArtistSearchViewController, "RootViewController should be ArtistSearchViewController")
        
    }
}
