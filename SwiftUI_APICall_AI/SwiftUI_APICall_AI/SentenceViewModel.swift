//
//  SentenceViewModel.swift
//  SwiftUI_APICall_AI
//
//  Created by Guillaume on 21/05/2024.
//

import Foundation

class SentenceViewModel: ObservableObject {
    @Published var sentence: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private let service: SentenceServiceProtocol

    init(service: SentenceServiceProtocol) {
        self.service = service
    }

    func fetchSentence() {
        Task {
            isLoading = true
            errorMessage = nil
            do {
                let response = try await service.fetchSentence()
                await MainActor.run {
                    sentence = response.citation.sentence
                }
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}
