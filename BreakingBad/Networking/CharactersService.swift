//
//  CharactersService.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 11/10/2022.
//

import Combine
import NetworkManagerSDK

protocol CharactersServiceProtocol {
    func fetchCharacters() -> AnyPublisher<[BBCharacter], RequestError>
}

struct CharactersService {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
}

extension CharactersService: CharactersServiceProtocol {
    func fetchCharacters() -> AnyPublisher<[BBCharacter], RequestError> {
        networkManager.performRequest(endpoint: .characters, authType: .none, response: [BBCharacter].self)
            .eraseToAnyPublisher()
    }
}


