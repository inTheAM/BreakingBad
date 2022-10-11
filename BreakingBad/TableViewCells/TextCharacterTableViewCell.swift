//
//  TextCharacterTableViewCell.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 11/10/2022.
//

import UIKit

final class TextCharacterTableViewCell: UITableViewCell, CustomTableViewCell {
    static let reuseIdentifier = "CharacterTableViewCell"
    
    func configure(with model: Model) {
        
    }
    
    func configureUI() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        let nameLabel = UILabel()
        nameLabel.text = "Label"
        nameLabel.font = .boldSystemFont(ofSize: 16)
        stackView.addArrangedSubview(nameLabel)
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Description"
        stackView.addArrangedSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])
        
    }
}
