//
//  OriginModel.swift
//  CharacterSearch
//
//  Created by Timur on 30.06.2022.
//

import Foundation

struct OriginModel: Codable {
    var id: Int?
    var name: String?
    var url: String?
}

extension OriginModel {
    static func makeOrigin() -> OriginModel {
        return OriginModel(id: 1,
                           name: "Earth",
                           url: "https://rickandmortyapi.com/api/location/1")
    }
}
