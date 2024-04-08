@testable import ArtistSearch

import XCTest

class ArtistSearchViewControllerTests: XCTestCase {
    let artistSearchViewController: ArtistSearchViewController = .init()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        loadViewController(artistSearchViewController)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testViewControllerHasTitle() {
        XCTAssert(artistSearchViewController.navigationItem.title?.isEmpty ?? true == false, "ArtistSearchViewController must have a title text")
    }

    func testCollectionViewHasDelegate() {
        XCTAssertNotNil(artistSearchViewController.searchCollectionView?.delegate, "ArtistSearchViewController must have a Delegate")
    }

    func testCollectionViewHasDataSource() {
        XCTAssertNotNil(artistSearchViewController.searchCollectionView?.dataSource, "ArtistSearchViewController must have DataSource")
    }

    func testControllerConformsToCollectionViewDelegateProtocol() {
        XCTAssertTrue(artistSearchViewController.conforms(to: UICollectionViewDelegate.self),
                      "ArtistSearchViewController must conforms UICollectionViewDelegate Protocol")
        XCTAssertTrue(artistSearchViewController.responds(to: #selector(artistSearchViewController.collectionView(_:didSelectItemAt:))),
                      "ArtistSearchViewController must responds to :didSelectItemAt method")
    }

    func testControllerConformsToCollectionViewDataSourceProtocol() {
        XCTAssertTrue(artistSearchViewController.conforms(to: UICollectionViewDataSource.self),
                      "ArtistSearchViewController must conforms DataSUICollectionViewDataSourceource Prototol")
        XCTAssertTrue(artistSearchViewController.responds(to: #selector(artistSearchViewController.collectionView(_:numberOfItemsInSection:))),
                      "ArtistSearchViewController must responds to :numberOfRowsInSection method")
        XCTAssertTrue(artistSearchViewController.responds(to: #selector(artistSearchViewController.collectionView(_:cellForItemAt:))),
                      "ArtistSearchViewController must responds to :cellForRowAt method")
    }
}
