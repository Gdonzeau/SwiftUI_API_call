//
//  APIData.swift
//  SwiftUI_API_call
//
//  Created by Guillaume on 20/05/2024.
//

import Foundation

struct ApiData {
    
    static let mainAdress = "https://kaamelott.chaudie.re/api/random/personnage/"
    
    static let reponseExample = Response(status: 1, citation: Citation(
        sentence: "Quand on veut être sûr de son coup, Seigneur Dagonet… on plante des navets. On ne pratique pas le putsch.",
        
        infos: Infos(
            author: "Alexandre Astier",
            actor: "François Rollin",
            character: "Loth",
            season: "Livre V",
            episode: "Les Repentants"
        )
    ))
   
}
