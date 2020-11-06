//
//  ArtistSearchUITests.swift
//  ArtistSearchUITests
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import XCTest
@testable import ArtistSearch

/*class ArtistSearchUITests: MainUITest {

    override func setUp() {
        continueAfterFailure = false
        setupApp()
        app.launch()
    }

    override func tearDown() {
    }
    
    func testSearchArtist() {
        let app = XCUIApplication()
        let searchAnArtistSearchField = app/*@START_MENU_TOKEN@*/.searchFields["Search an artist"]/*[[".otherElements[\"ArtistSearch.serachBar\"].searchFields[\"Search an artist\"]",".searchFields[\"Search an artist\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        searchAnArtistSearchField.tap()

        app.keys["C"].tap()
        app/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.keys["l"].tap()
        app.keys["d"].tap()
        app.keys["p"].tap()
        app.keys["l"].tap()
        app.keys["a"].tap()
        app.keys["y"].tap()

        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"buscar\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()

        let resultCollectionCell = XCUIApplication().collectionViews["ArtistSearch.collectionView"].staticTexts["Coldplay"] 
        resultCollectionCell.tap()
    }
}*/
