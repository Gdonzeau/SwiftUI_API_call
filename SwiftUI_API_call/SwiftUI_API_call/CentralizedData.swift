//
//  CentralizedData.swift
//  SwiftUI_API_call
//
//  Created by Guillaume on 21/05/2024.
//

import Foundation
import Combine

class CentralizedData: ObservableObject {
    static var shared: CentralizedData = .init()
    
    let combineResponse: PassthroughSubject<Response, Never> = .init()
    
}
