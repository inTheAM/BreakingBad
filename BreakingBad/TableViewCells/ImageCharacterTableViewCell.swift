//
//  ImageCharacterTableViewCell.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 11/10/2022.
//

import UIKit

final class ImageCharacterTableViewCell: UITableViewCell {
    static let reuseIdentifier = "CharacterTableViewCell"
    
    func configureUI() {
        // Creating the stack view
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        // Character image setup
        let image = UIImage(systemName: "person.fill")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        
        // Character overview setup
        // Name label
        let nameLabel = UILabel()
        nameLabel.text = "Label"
        nameLabel.font = .boldSystemFont(ofSize: 16)
        nameLabel.backgroundColor = .white.withAlphaComponent(0.4)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameLabel)
        
        stackView.distribution = .fillProportionally
        
        // Setting constraints
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),
            
        ])
    }
}
