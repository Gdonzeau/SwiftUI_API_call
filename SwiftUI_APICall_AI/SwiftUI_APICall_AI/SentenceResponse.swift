//
//  SentenceResponse.swift
//  SwiftUI_APICall_AI
//
//  Created by Guillaume on 21/05/2024.
//

import Foundation

struct SentenceResponse: Codable {
    let status: Int
    let citation: Citation
}

struct Citation: Codable {
    let sentence : String
    let infos : Infos
    
    enum CodingKeys: String, CodingKey {
        case sentence = "citation"
        case infos
    }
    
}

struct Infos: Codable {
    let author: String
    let actor: String
    let character: String
    let season: String
    let episode: String
    
    enum CodingKeys: String, CodingKey {
        case author = "auteur"
        case actor = "acteur"
        case character = "personnage"
        case season = "saison"
        case episode = "episode"
    }
}
