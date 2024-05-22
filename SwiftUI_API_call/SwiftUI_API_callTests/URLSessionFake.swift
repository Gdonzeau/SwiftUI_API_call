//
//  URLSessionFake.swift
//  SwiftUI_API_callTests
//
//  Created by Guillaume on 21/05/2024.
//

import Foundation

class URLSessionFake: URLSession {
    var data: Data?
    var response: URLResponse?
    var error: Error? 
    /*
    init(data: Data? = nil, response: URLResponse? = nil, error: Error? = nil) {
        self.data = data
        self.response = response
        self.error = error
    }
     */
}

