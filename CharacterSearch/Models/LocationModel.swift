//
//  LocationModel.swift
//  CharacterSearch
//
//  Created by Timur on 30.06.2022.
//

import Foundation

struct LocationModel: Codable {
    var id: Int?
    var name: String?
    var type: String?
    var dimension: String?
    var residents: [String]?
    var url: String?
    var created: String?
}

extension LocationModel {
    static func makeLocation() -> LocationModel {
        return LocationModel(id: 2,
                              name: "Earth",
                              url: "https://rickandmortyapi.com/api/location/20")
    }
}
