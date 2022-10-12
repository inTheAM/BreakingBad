//
//  ViewController.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 08/10/2022.
//
import Combine
import UIKit

class ViewController: UITableViewController {
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
        viewModel.fetchCharacters()
        receiveData()
        
    }
    
    func registerCells() {
        tableView.register(ImageCharacterTableViewCell.self, forCellReuseIdentifier: ModelType.characterWithImage.rawValue)
        tableView.register(TextCharacterTableViewCell.self, forCellReuseIdentifier: ModelType.characterWithoutImage.rawValue)
    }
    
    func receiveData() {
        viewModel.characters
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }

}

extension ViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}

