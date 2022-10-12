//
//  BBCharacter.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 12/10/2022.
//

import Foundation

struct BBCharacter: Model, Decodable {
    // simulating different types
    let type: ModelType = Bool.random() ? .characterWithImage : .characterWithoutImage
    let name: String
    let status: String
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case name,
             status,
             image = "img"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        status = try container.decode(String.self, forKey: .status)
        image = try container.decode(String.self, forKey: .image)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.status, forKey: .status)
    }
}
