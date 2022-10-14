//
//  BBCharacter.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 12/10/2022.
//

import Foundation

struct BBCharacter: Model, Decodable {
    // Simulating different types
    let type: ModelType = Bool.random() ? .characterWithImage : .characterWithoutImage
    
    let name: String
    let portrayed: String
    let status: String
    let image: String
    let nickname: String
    let birthday: String
    let appearance: [Int]
    
    // Decodable conformance
    enum CodingKeys: String, CodingKey {
        case name,
             portrayed,
             status,
             image = "img",
             nickname,
             birthday,
             appearance
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        portrayed = try container.decode(String.self, forKey: .portrayed)
        status = try container.decode(String.self, forKey: .status)
        image = try container.decode(String.self, forKey: .image)
        nickname = try container.decode(String.self, forKey: .nickname)
        birthday = try container.decode(String.self, forKey: .birthday)
        appearance = try container.decode([Int].self, forKey: .appearance)
    }
}
