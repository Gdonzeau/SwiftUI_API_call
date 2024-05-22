//
//  CallApi.swift
//  SwiftUI_API_call
//
//  Created by Guillaume on 20/05/2024.
//

import Foundation
import Combine

class CallApi: ObservableObject {

    let centralizedData = CentralizedData.shared
    
    private var networkSession: NetworkInterface
    
    var isError: Bool = false
    var error: NetworkErrors?
    var url:URL?
    
    init(url: URL? = URL(string: "https://www.gdtr.fr")!, networkSession: NetworkInterface = NetworkSession()) {
        
        self.url = url
        self.networkSession = networkSession
    }
    
    private func modelizeUrl(search character: String, completionHandler: @escaping (Result<URL, NetworkErrors>) -> Void ) {
        guard let url = URL(string: ApiData.mainAdress + character) else {
            let error = NetworkErrors.invalidURL
            completionHandler(.failure(error))
            return
        }
        print("URL: \(url)")
        
        completionHandler(.success(url))
    }
    
    func createUrl(character: Character) {
        modelizeUrl(search: character.rawValue) { result in
            switch result {
                    
                case .success(let url):
                    self.url = url
                case .failure(let error):
                    self.error = error
            }
        }
    }
    
    func getCitation() async throws {
        
        var responseData = Data()
        
        do {
            guard let url = self.url else {
                error = NetworkErrors.invalidURL
                return
            }
            responseData = try await networkSession.fetchData(url: url)
            
        } catch {

            if let error = error as? NetworkErrors {
                self.error = error
                self.isError = true
                throw error
            }
        }
        
        do {

            let response = try JSONDecoder().decode(Response.self, from: responseData)
            
            await MainActor.run {
                    centralizedData.combineResponse.send(response)
            }
        } catch {
            throw NetworkErrors.decodingError
        }
    }
}
