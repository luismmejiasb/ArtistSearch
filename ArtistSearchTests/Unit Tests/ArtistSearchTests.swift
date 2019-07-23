//
//  ArtistSearchPresenterSearch.swift
//  ArtistSearchTests
//
//  Created by Luis Mejías on 5/22/19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import XCTest
import Alamofire

@testable import ArtistSearch

class ArtistSearchTests: XCTestCase {
    
    // MARK: - Constants/Variables
    var artistSearchNavigationController: ArtistNavigationController = UIStoryboard.artistSearchNavigationController()
    var artistSearchViewController: ArtistSearchViewController? = ArtistSearchViewController()
    var mockInteractor: MockInteractor! = MockInteractor()
    var mockView: MockView! = MockView()
    var mockWireFrame: MockWireFrame! = MockWireFrame()
    var mockPresenter: ArtistSearchPresenter?
    
    override func setUp() {
        continueAfterFailure = false
        artistSearchViewController = artistSearchNavigationController.topViewController as? ArtistSearchViewController
        loadViewController(artistSearchViewController!)
    }
    
    override func tearDown() {
        artistSearchViewController = nil
        artistSearchViewController = nil
        mockInteractor = nil
        mockView = nil
        mockWireFrame = nil
        mockPresenter = nil
    }
    
    func testInteractorSearchItem() {
        mockInteractor.searchTerm(withFilteringType: .artist, and: "Bruno") { (artists, code) in
            XCTAssertNotNil(artists, "searchTerm results cannot be nil")
            XCTAssert(code >= 200 || code < 300, "searchTerm response status code must be success")
            XCTAssertEqual(artists[0].artistId, 1, "searchTerm artistId must be '1'")
        }
    }
    
    func testPresenterUpdateView() {
        mockPresenter = ArtistSearchPresenter.init(view: mockView, interactor: mockInteractor, wireframe: mockWireFrame)
        mockPresenter?.searchTerm(with: .artist, and: "Bruno")
        XCTAssertTrue(mockView.viewReloaded)
        mockView.viewReloaded = false
    }
    
    func testViewControllerHasTitle() {
        XCTAssert(artistSearchViewController?.navigationItem.title?.isEmpty ?? false, "ArtistSearchViewController must have a title text")
    }
    
    func testCollectionViewHasDelegate() {
        XCTAssertNotNil(artistSearchViewController?.searchCollectionView?.delegate, "ArtistSearchViewController must have a Delegate")
    }
    
    func testCollectionViewHasDataSource() {
        XCTAssertNotNil(artistSearchViewController?.searchCollectionView?.dataSource, "ArtistSearchViewController must have DataSource")
    }
    
    func testControllerConfromsToCollectionViewDelegateProtocol() {
        // swiftlint:disable line_length
        XCTAssertTrue((artistSearchViewController?.conforms(to: UICollectionViewDelegate.self))!, "ArtistSearchViewController must conforms UICollectionViewDelegate Protocol")
        XCTAssertTrue((artistSearchViewController?.responds(to: #selector(artistSearchViewController?.collectionView(_:didSelectItemAt:))))!, "ArtistSearchViewController must responds to :didSelectItemAt method")
    }
    
    func testControllerConformsToCollectionViewDataSourceProtocol() {
        // swiftlint:disable line_length
        XCTAssertTrue((artistSearchViewController?.conforms(to: UICollectionViewDataSource.self))!, "ArtistSearchViewController must conforms DataSUICollectionViewDataSourceource Prototol")
        XCTAssertTrue((artistSearchViewController?.responds(to: #selector(artistSearchViewController?.collectionView(_:numberOfItemsInSection:))))!, "ArtistSearchViewController must responds to :numberOfRowsInSection method")
        XCTAssertTrue((artistSearchViewController?.responds(to: #selector(artistSearchViewController?.collectionView(_:cellForItemAt:))))!, "ArtistSearchViewController must responds to :cellForRowAt method")
    }
    
    func testArtistDetailWireframeGotPushed() {
        let mockNavigationController = UINavigationController()
        mockNavigationController.pushWireframe(ArtistDetailWireframe(selectedArtist: Artist.init(artistId: 1, primaryGenreName: "Something", wrapperType: "Shomething", artistName: "Someone", artistType: "Some Type", artistLinkUrl: "Some URL", primaryGenreId: 2)))
        
        XCTAssertTrue(mockNavigationController.viewControllers.last is ArtistDetailViewController, "The pushed viewController has to be ArtistDetailViewController")
    }
    
    func testFavoriteSearchsWireframeGotPushed() {
        let mockNavigationController = UINavigationController()
        mockNavigationController.pushWireframe(FavoriteSearchWireframe())
        
        XCTAssertTrue(mockNavigationController.viewControllers.last is FavoriteSearchViewController, "The pushed viewController has to be FavoriteSearchViewController")
    }
    
}

class MockInteractor: ArtistSearchInteractorInterface {
    
    func searchTerm(withFilteringType filterType: FilteringType, and termString: String, completion: @escaping ([Artist], Int) -> Void) {
        completion([Artist.init(artistId: 1, primaryGenreName: "Something", wrapperType: "Shomething", artistName: "Someone", artistType: "Some Type", artistLinkUrl: "Some URL", primaryGenreId: 2)], 200)
    }
    
    func cancelAPIRequest() {
        
    }
    
}

class MockView: ArtistSearchViewInterface {
    
    var viewReloaded = false
    
    func reloadDataInView(with artistsData: [Artist]) {
        viewReloaded = true
    }
}

class MockWireFrame: ArtistSearchWireframeInterface {
    
    func popFromNavigationController(animated: Bool) {
        
    }
    
    func dismiss(animated: Bool) {
        
    }
    
    func showErrorAlert(with message: String?) {
        
    }
    
    func showAlert(with title: String?, message: String?) {
        
    }
    
    func showAlert(with title: String?, message: String?, actions: [UIAlertAction]) {
        
    }
    
    func handdleHTTPError(withErrorCode errorCode: Int) {
        
    }
}
