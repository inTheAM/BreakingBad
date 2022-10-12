//
//  ImageCharacterTableViewCell.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 11/10/2022.
//

import Kingfisher
import UIKit

final class ImageCharacterTableViewCell: UITableViewCell, CustomTableViewCell {
    override var reuseIdentifier: String? {
        ModelType.characterWithImage.rawValue
    }
    private var character: BBCharacter!
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var characterImage: UIImageView = {
        let image = UIImage(systemName: "person.fill")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(stackView)
        
        stackView.addArrangedSubview(characterImage)
        stackView.addArrangedSubview(nameLabel)
        
        // Setting constraints
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            characterImage.heightAnchor.constraint(equalToConstant: 150),
            characterImage.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            characterImage.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with model: Model) {
        guard let model = model as? BBCharacter else {
            print("Unable to cast model as BBCharacter: \(model)")
            return
        }
        
        self.character = model
        
        configureUI()
    }
    
    func configureUI() {
        nameLabel.text = character.name
        guard let imageURL = URL(string: character.image)
        else { return }
        characterImage.kf.setImage(with: imageURL)
    }
}
