//
//  ResponseModel.swift
//  CharacterSearch
//
//  Created by Timur on 30.06.2022.
//

import Foundation

public class ResponseModel<T: Decodable>: Decodable {
    var info: InfoModel?
    var results: T
    
    enum CodingKeys: String, CodingKey {
        case info = "info"
        case results = "results"
    }
    
    init(info: InfoModel, results: T) {
        self.info = info
        self.results = results
    }
}
