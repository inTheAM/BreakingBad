//
//  ViewController.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 08/10/2022.
//

import UIKit

class ViewController: UITableViewController {
    weak var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Breaking Bad"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }


}

