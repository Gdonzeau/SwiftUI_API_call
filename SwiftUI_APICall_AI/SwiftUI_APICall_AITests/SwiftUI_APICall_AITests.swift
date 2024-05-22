//
//  SwiftUI_APICall_AITests.swift
//  SwiftUI_APICall_AITests
//
//  Created by Guillaume on 21/05/2024.
//

import XCTest
@testable import SwiftUI_APICall_AI

class SentenceServiceMock: SentenceServiceProtocol {
    var shouldReturnError = false
    
    func fetchSentence() async throws -> SentenceResponse {
        if shouldReturnError {
            throw NSError(domain: "TestError", code: 1, userInfo: nil)
        } else {
            let response = SentenceResponse(status: 1, citation: Citation(sentence: "Chouette", infos: Infos(author: "truc", actor: "Muche", character: "Machin", season: "3", episode: "2")))
            return response
        }
    }
}

class SentenceViewModelTests: XCTestCase {
    var service: SentenceServiceMock!
    var viewModel: SentenceViewModel!
    
    override func setUp() {
        super.setUp()
        service = SentenceServiceMock()
        viewModel = SentenceViewModel(service: service)
    }
    
    override func tearDown() {
        service = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchSentenceSuccess() async {
        viewModel.fetchSentence()
        XCTAssertEqual(viewModel.sentence, "Test sentence")
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testFetchSentenceFailure() async {
        service.shouldReturnError = true
        viewModel.fetchSentence()
        XCTAssertEqual(viewModel.sentence, "")
        XCTAssertNotNil(viewModel.errorMessage)
    }
}
