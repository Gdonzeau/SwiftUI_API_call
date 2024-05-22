//
//  APICallViewModel.swift
//  SwiftUI_API_call
//
//  Created by Guillaume on 20/05/2024.
//

import Foundation
import Combine

class APICallViewModel: ObservableObject {
    @Published var centralizedData = CentralizedData.shared
    @Published var response: Response = ApiData.reponseExample
    
    var model = CallApi()

    private lazy var cancellables: Set<AnyCancellable> = .init()
    
    deinit {
        cancellables.cancel()
    }
    
    init() {
        print("Initialisé")
        centralizedData.combineResponse
            .sink { [weak self] response in
                    self?.response = response
            }
            .store(in: &cancellables)
    }
    
    func getCitation(of character: Character) {
        
        model.createUrl(character: character)
        Task {
            try? await model.getCitation()
        }
    }
}
