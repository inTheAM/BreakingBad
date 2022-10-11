//
//  ViewModel.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 11/10/2022.
//

import UIKit

final class ViewModel: NSObject {
    private(set) var characters: [Model] = []
    private let charactersService: CharactersServiceProtocol
    
    init(charactersService: CharactersServiceProtocol = CharactersService()) {
        self.charactersService = charactersService
    }
    
}

extension ViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row.isMultiple(of: 2) {
            let cell = tableView.dequeueReusableCell(withIdentifier: ModelType.characterWithImage.rawValue, for: indexPath) as! CustomTableViewCell
            
            (cell as? ImageCharacterTableViewCell)?.configureUI()
            return cell as UITableViewCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ModelType.characterWithoutImage.rawValue, for: indexPath) as! CustomTableViewCell
            
            (cell as? TextCharacterTableViewCell)?.configureUI()
            return cell
        }
    }
    
    
}
