//
//  CharactersService.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 11/10/2022.
//

import Combine
import NetworkManagerSDK

protocol CharactersServiceProtocol {
    
}

struct CharactersService {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
}

extension CharactersService: CharactersServiceProtocol {
    
}
