//
//  ContentView.swift
//  SwiftUI_API_call
//
//  Created by Guillaume on 20/05/2024.
//

import SwiftUI

struct APICallView: View {
    @StateObject var viewModel = APICallViewModel()
    @State var characterSelected: Character = .Angharad
    
    var body: some View {
        VStack {
            CharacterPicker(selectedCharacter: $characterSelected)
            
            CitationView(citation: viewModel.response.citation)
            
            Button("Nouvelle citation") {
                viewModel.getCitation(of: characterSelected)
            }
            
            .padding()
            .background(LinearGradient(colors: [.yellow, .green], startPoint: .topLeading, endPoint: .bottomTrailing))
            .overlay(RoundedRectangle(cornerRadius: 10.0, style: .continuous).stroke(Color.white, style: StrokeStyle(lineWidth: 2)).blendMode(.overlay))
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
        }
        .padding()
    }
}

#Preview {
    APICallView()
}
