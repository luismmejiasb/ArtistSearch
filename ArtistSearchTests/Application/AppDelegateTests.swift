//
//  AppDelegateTests.swift
//  MovAppTests
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit
import XCTest
@testable import ArtistSearch

class AppDelegateTests: XCTestCase {
    // swiftlint:disable weak_delegate
    let appDelegate: AppDelegate? = AppDelegate()
    var window: UIWindow? = UIWindow()
    
    override func setUp() {
        super.setUp()
        appDelegate?.window = window
    }
    
    override func tearDown() {
        super.tearDown()
        window = nil
        appDelegate?.window = window
    }
    
    // MARK: Test after application launch
    
    func testWindowIsKeyAfterApplicationLaunch() {
        if let window = UIApplication.shared.keyWindow {
            XCTAssertTrue(window.isKeyWindow, "App delegate window should not be nil")
        } else {
            XCTFail("App delegate window can't be nil and has a window")
        }
    }
    
    func testThatDidFinishLaunchingWithOptionsReturnsTrue() {
        // swiftlint:disable line_length
        XCTAssertNotNil((appDelegate?.application(UIApplication.shared, didFinishLaunchingWithOptions: nil))!, "Method didFinishLaunchingWithOptions can't be nil")
        XCTAssertTrue((appDelegate?.application(UIApplication.shared, didFinishLaunchingWithOptions: nil))!, "Should return true from didFinishLaunchingWithOptions")
    }
}
