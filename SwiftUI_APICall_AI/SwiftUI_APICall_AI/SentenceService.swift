//
//  SentenceService.swift
//  SwiftUI_APICall_AI
//
//  Created by Guillaume on 21/05/2024.
//

import Foundation

protocol SentenceServiceProtocol {
    func fetchSentence() async throws -> SentenceResponse
}

class SentenceService: SentenceServiceProtocol {
    private let url = URL(string: "https://kaamelott.chaudie.re/api/random")!

    func fetchSentence() async throws -> SentenceResponse {
        let (data, response) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(SentenceResponse.self, from: data)
    }
}
