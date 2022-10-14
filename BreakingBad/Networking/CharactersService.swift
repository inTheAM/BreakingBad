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

enum CharacterServiceError: String, Error {
    case failedToFetchCharacters = "Failed to fetch characters."
}

/// # NetworkManagerSDK is a Combine networking Framework I am building and using in my personal projects.
/// Creating a service is done as below, where the `NetworkManager` object makes requests, requiring only an Endpoint, which you can make as in the `EndpointsList` struct.
/// Using `NetworkManagerProtocol` allows stubbing in unit testing to skip making actual network requests.
/// If you have any questions or would like to see the code, let me know.
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


