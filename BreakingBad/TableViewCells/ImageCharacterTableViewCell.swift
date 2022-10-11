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
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.backgroundColor = .red.withAlphaComponent(0.5)
        let image = UIImage(systemName: "person.fill")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        
        let textStackView = UIStackView()
        textStackView.axis = .vertical
        let nameLabel = UILabel()
        nameLabel.text = "Label"
        nameLabel.font = .boldSystemFont(ofSize: 16)
        nameLabel.backgroundColor = .white.withAlphaComponent(0.4)
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Description"
        
        stackView.addArrangedSubview(imageView)
        textStackView.addArrangedSubview(nameLabel)
        
        stackView.addArrangedSubview(textStackView)
        stackView.distribution = .fillProportionally
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),
            
        ])
    }
}
