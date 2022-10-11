//
//  ViewModel.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 11/10/2022.
//

import UIKit

final class ViewModel: NSObject {
    
    
    
}

extension ViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row.isMultiple(of: 2) {
            let cell = ImageCharacterTableViewCell()
            cell.configureUI()
            return cell
        } else {
            let cell = TextCharacterTableViewCell()
            cell.configureUI()
            return cell
        }
    }
    
    
}
