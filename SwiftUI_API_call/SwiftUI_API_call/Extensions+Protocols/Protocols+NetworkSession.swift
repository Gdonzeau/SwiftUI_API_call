//
//  Protocols+NetworkSession.swift
//  SwiftUI_API_call
//
//  Created by Guillaume on 20/05/2024.
//

import Foundation
protocol NetworkInterface {
    func fetchData(url: URL)  async throws -> Data
}

class NetworkSession : NetworkInterface {
    
    private var urlSession: URLSession
    
    init(urlSession: URLSession = URLSession(configuration: .default)) {
        self.urlSession = urlSession
    }
    
    func fetchData(url: URL) async throws -> Data {
        let (data, response) = try await urlSession.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkErrors.invalidStatusCode
        }
        
        return data
    }
}
