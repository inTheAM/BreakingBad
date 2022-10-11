//
//  CustomTableViewCell.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 11/10/2022.
//

import UIKit

protocol CustomTableViewCell: AnyObject, UITableViewCell {
    func configure(with model: Model) 
}
