//
//  ViewController.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 08/10/2022.
//

import UIKit

class ViewController: UITableViewController {
    weak var coordinator: Coordinator?
    private let viewModel = ViewModel()
    
    
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
        
        
    }
    
    func registerCells() {
        tableView.register(ImageCharacterTableViewCell.self, forCellReuseIdentifier: ModelType.characterWithImage.rawValue)
        tableView.register(TextCharacterTableViewCell.self, forCellReuseIdentifier: ModelType.characterWithoutImage.rawValue)
    }

}

extension ViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}

