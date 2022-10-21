//
//  ViewController.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 08/10/2022.
//

import Combine
import UIKit

class CharactersListViewController: UITableViewController {
    weak var coordinator: Coordinator?
    private let viewModel = ViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Breaking Bad"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = viewModel
        registerCells()
        viewModel.fetchCharacters { [weak self] in
            self?.tableView.reloadData()
        }
        handleError()
        
    }
    
    func registerCells() {
        tableView.register(ImageCharacterTableViewCell.self, forCellReuseIdentifier: ModelType.characterWithImage.rawValue)
        tableView.register(TextCharacterTableViewCell.self, forCellReuseIdentifier: ModelType.characterWithoutImage.rawValue)
    }
    
    func handleError() {
        viewModel.error
            .sink { [weak self] error in
                self?.presentErrorAlert(error)
            }
            .store(in: &cancellables)
    }
    
    func presentErrorAlert(_ error: CharacterServiceError) {
        let alert = UIAlertController(title: "Error", message: error.rawValue, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }

}

extension CharactersListViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = viewModel.characters[indexPath.row]
        guard let coordinator = coordinator as? MainCoordinator
        else { return }
        
        coordinator.showDetail(for: character)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = viewModel.characters[indexPath.row]
        let identifier = character.type.rawValue
        
        // Setting the table view cell based on the type of data received
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CustomTableViewCell
        
        cell.configure(with: character)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

