//
//  CharacterPicker.swift
//  SwiftUI_API_call
//
//  Created by Guillaume on 21/05/2024.
//

import SwiftUI

struct CharacterPicker: View {
    @Binding var selectedCharacter: Character
    let allCharacters = Character.allCases
    
    var body: some View {
        VStack {
            Picker("Characters", selection: $selectedCharacter) {
                ForEach(allCharacters, id: \.self) {
                    Text($0.rawValue)
                                }
            }
            .onChange(of: selectedCharacter) { newValue in
                self.selectedCharacter = newValue
            }
        }
    }
}

#Preview {
    CharacterPicker(selectedCharacter: .constant(.Arthur))
}
