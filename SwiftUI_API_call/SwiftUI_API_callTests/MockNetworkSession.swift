//
//  MockNetworkSession.swift
//  SwiftUI_API_callTests
//
//  Created by Guillaume on 21/05/2024.
//

import Foundation
@testable import SwiftUI_API_call

class MockNetworkSessionNet: NetworkInterface {
    private var urlSession: URLSession
    
    init(urlSession: URLSession = URLSession(configuration: .default)) {
        self.urlSession = urlSession
    }
    
    func fetchData(url: URL) async throws -> Data {
        var responseToBeUsed = FakeResponseData.responseKo
        
        var dataToReturn = Data()
        
        if url == URL(string: "SendRightData")! {
            return FakeResponseData.NewsCorrectData
        } else if url == URL(string: "SendBadData")! {
            return FakeResponseData.NewsIncorrectData
        }
        
        if url != URL(string: "BadResponse") {
            let (data, response) = try await urlSession.data(from: url)
            dataToReturn = data
            responseToBeUsed = (response as? HTTPURLResponse)!
        }
        
        guard responseToBeUsed.statusCode == 200 else {
            throw NetworkErrors.invalidStatusCode
        }
        
        return dataToReturn
    }
}
