//
//  CharacterModel.swift
//  CharacterSearch
//
//  Created by Timur on 30.06.2022.
//

import Foundation

struct CharacterModel: Codable {
    var id: Int
    var name: String
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var origin: OriginModel?
    var location: LocationModel?
    var image: String?
    var episode: [String]?
    var url: String?
    var created: String?
}

extension CharacterModel {
    static func makeCharacter() -> CharacterModel {
        return CharacterModel(id: 1,
                              name: "Rick Sanchez",
                              status: "Alive",
                              species: "Human",
                              type: "",
                              gender: "Male",
                              origin: OriginModel.makeOrigin(),
                              location: LocationModel.makeLocation(),
                              image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                              episode: ["https://rickandmortyapi.com/api/episode/1",
                                        "https://rickandmortyapi.com/api/episode/2"],
                              url: "https://rickandmortyapi.com/api/character/1",
                              created: "2017-11-04T18:48:46.250Z")
    }
}
