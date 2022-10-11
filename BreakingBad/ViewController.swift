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
    }

}

extension ViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}

