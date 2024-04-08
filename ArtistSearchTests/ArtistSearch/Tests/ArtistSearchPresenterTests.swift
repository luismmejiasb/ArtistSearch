@testable import ArtistSearch
import XCTest

class ArtistSearchPresenterTests: XCTestCase {
    var presenterToTest: ArtistSearchPresenterProtocol?
    var routerMock = ArtistSearchRouterMock()
    var interactorMock = ArtistSearchInteractorMock()
    let searchTermSelector = "searchTerm(withFilteringType:and:completion:)"
    let presentArtistDetailSelector = "presentArtistDetail(_:)"
    let cancelAPIRequestSelector = "cancelAPIRequest()"
    let presentFavoriteSearchs = "presentFavoriteSearchs()"

    override func setUp() {
        super.setUp()
        presenterToTest = ArtistSearchPresenter(interactor: interactorMock, router: routerMock)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSearchTerm() {
        let filterType: FilteringType = .artist
        let searchTerm = "Cold Play"
        presenterToTest!.searchTerm(type: filterType, and: searchTerm)

        let expectedFunctionsCalled = 1
        let functionsCalled = routerMock.functionsCalled + interactorMock.functionsCalled
        if expectedFunctionsCalled == functionsCalled.count {
            XCTAssertEqual(functionsCalled[0], searchTermSelector)
        } else {
            XCTAssertTrue(false, "Expected functions called must equal to called functions after test")
        }
    }

    func testPresentArtistDetail() {
        let artist = Artist()
        presenterToTest!.presentArtistDetail(artist)

        let expectedFunctionsCalled = 1
        let functionsCalled = routerMock.functionsCalled
        if expectedFunctionsCalled == functionsCalled.count {
            XCTAssertEqual(functionsCalled[0], presentArtistDetailSelector)
        } else {
            XCTAssertTrue(false, "Expected functions called must equal to called functions after test")
        }
    }

    func testCancelAPIRequest() {
        presenterToTest!.cancelAPIRequest()

        let expectedFunctionsCalled = 1
        let functionsCalled = interactorMock.functionsCalled
        if expectedFunctionsCalled == functionsCalled.count {
            XCTAssertEqual(functionsCalled[0], cancelAPIRequestSelector)
        } else {
            XCTAssertTrue(false, "Expected functions called must equal to called functions after test")
        }
    }

    func testPresentFavoriteSearchs() {
        presenterToTest!.presentFavoriteSearchs()

        let expectedFunctionsCalled = 1
        let functionsCalled = routerMock.functionsCalled
        if expectedFunctionsCalled == functionsCalled.count {
            XCTAssertEqual(functionsCalled[0], presentFavoriteSearchs)
        } else {
            XCTAssertTrue(false, "Expected functions called must equal to called functions after test")
        }
    }
}
