//
//  ContentView.swift
//  SwiftUI_APICall_AI
//
//  Created by Guillaume on 21/05/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SentenceViewModel(service: SentenceService())

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
            } else {
                Text(viewModel.sentence)
                    .padding()
            }
            Button("Fetch Sentence") {
                viewModel.fetchSentence()
            }
            .padding()
        }
        .onAppear {
            viewModel.fetchSentence()
        }
    }
}
