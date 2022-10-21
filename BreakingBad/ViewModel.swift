//
//  ViewModel.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 11/10/2022.
//

import Combine
import UIKit

final class ViewModel: NSObject {
    /// The characters to show in the tableview
    private(set) var characters = [Model]()
    
    /// The service that fetches the characters.
    /// Dependency Injection is used here with protocols for ease of testing.
    private let charactersService: CharactersServiceProtocol
    
    init(charactersService: CharactersServiceProtocol = CharactersService()) {
        self.charactersService = charactersService
    }
    
    /// An error, set as a PassthroughSubject, which can send the error to the view controller to be displayed in an alert for example.
    private(set) var error = PassthroughSubject<CharacterServiceError, Never>()
    
    private var cancellables = Set<AnyCancellable>()
    
    
    /// Fetches characters using the charactersService.
    /// - Parameter completionHandler: A method to run when fetching is complete. eg `tableView.reloadData()`
    func fetchCharacters(_ completionHandler: @escaping ()->()) {
        charactersService.fetchCharacters()
            .receive(on: RunLoop.main)
            .catch { error -> AnyPublisher<[BBCharacter], Never> in
                self.error.send(.failedToFetchCharacters)
                return Just([])
                    .setFailureType(to: Never.self)
                    .eraseToAnyPublisher()
            }
            .sink { [weak self] characters in
                self?.characters = characters
                completionHandler()
            }
            .store(in: &cancellables)
    }
    
}

