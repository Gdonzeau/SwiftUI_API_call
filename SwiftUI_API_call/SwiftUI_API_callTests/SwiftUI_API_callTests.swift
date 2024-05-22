//
//  SwiftUI_API_callTests.swift
//  SwiftUI_API_callTests
//
//  Created by Guillaume on 20/05/2024.
//

import XCTest
@testable import SwiftUI_API_call

final class SwiftUI_API_callTests: XCTestCase {
    var viewModel: APICallViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGettingUrlWithSearchCorrectWhenCallingFunctionReturnCorrectUrl() async {
        //Getting
        let awaitedUrl = URL(string: "https://kaamelott.chaudie.re/api/random/personnage/Le%20Tavernier")
        let model = CallApi(url: URL(string: ApiData.mainAdress)! , networkSession: MockNetworkSessionNet())
        viewModel = APICallViewModel()
        viewModel.model = model
        XCTAssertTrue(awaitedUrl != viewModel.model.url)
        
        //When
        model.createUrl(character: .LeTavernier)
        
        XCTAssertTrue(awaitedUrl == model.url)
                
        
        
        //wait(for: [expectation], timeout: 0.3)
        
    }
    
    func testGettingBadURLWhencreatingURLThenReturnError() {
        let apiData = ApiData()
        let errorAwaited: NetworkErrors = .invalidURL
        let model = CallApi(url: URL(string: ApiData.mainAdress)! , networkSession: MockNetworkSessionNet())
        
        viewModel = APICallViewModel()
        viewModel.model = model
        
        viewModel.model.createUrl(character: .Arthur)
    }
    
    @MainActor
    func testGettingBadUrlWhenGettingCitationThenReturnError() async throws {
        let expectation = XCTestExpectation(description: "waiting end of call API")
        let errorAwaited: NetworkErrors = .invalidURL
        let model = CallApi(url: URL(string: "badUrl") , networkSession: MockNetworkSessionNet())
        
        viewModel = APICallViewModel()
        viewModel.model = model
        XCTAssertTrue(viewModel.model.error != errorAwaited)
        viewModel.getCitation(of: .Arthur)
        XCTAssertTrue(viewModel.model.error == errorAwaited)
        //wait(for: [expectation], timeout: 0.3)
        //await fulfillment(of: [expectation])
    }
    
    func testBadData() async {
        let urlSession = URLSessionFake()
        let session = NetworkSession(urlSession: <#T##URLSession#>)
    }

}
