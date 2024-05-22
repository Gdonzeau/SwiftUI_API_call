//
//  Set+Cancellable.swift
//  SwiftUI_API_call
//
//  Created by Guillaume on 21/05/2024.
//

import Combine

extension Set where Element: Cancellable {

    func cancel() {
        forEach { $0.cancel() }
    }
}
