//
//  PictureView.swift
//  SwiftUI_API_call
//
//  Created by Guillaume on 20/05/2024.
//

import SwiftUI

struct CitationView: View {
    let citation: Citation
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                VStack {
                    Text(citation.sentence)
                        .padding()
                        .frame(maxWidth: .infinity)
                        //.padding()
                    HStack {
                        Spacer()
                        Text(citation.infos.character)
                            .padding(.horizontal)
                    }
                }
            }
            .frame(maxWidth:.infinity)
            .frame(height: 500)
            .padding()
        }
        
    }
}


#Preview {
    CitationView(citation: ApiData.reponseExample.citation)
}
