//
//  ViewModel.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 11/10/2022.
//

import Combine
import UIKit
enum CharacterServiceError {
    case failedToFetchCharacters
}
final class ViewModel: NSObject {
    private(set) var characters = CurrentValueSubject<[Model], Never>([])
    private let charactersService: CharactersServiceProtocol
    private(set) var error = PassthroughSubject<CharacterServiceError, Never>()
    private var cancellables = Set<AnyCancellable>()
    init(charactersService: CharactersServiceProtocol = CharactersService()) {
        self.charactersService = charactersService
    }
    
    func fetchCharacters() {
        charactersService.fetchCharacters()
            .receive(on: RunLoop.main)
            .catch { error -> AnyPublisher<[BBCharacter], Never> in
                self.error.send(.failedToFetchCharacters)
                return Just([])
                    .setFailureType(to: Never.self)
                    .eraseToAnyPublisher()
            }
            .sink { characters in
                self.characters.send(characters)
            }
            .store(in: &cancellables)
    }
    
}

extension ViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = characters.value[indexPath.row]
        let identifier = character.type.rawValue
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CustomTableViewCell
        cell.configure(with: character)
        return cell
    }
    
    
}
