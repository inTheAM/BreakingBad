//
//  CharacterDetailViewController.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 13/10/2022.
//

import Kingfisher
import UIKit

class CharacterDetailViewController: UIViewController {
    var character: BBCharacter!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        // Creating the scrollview
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        
        view.addSubview(scrollView)
        
        // Creating the main stack view
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(stackView)
        
        // Creating the character image view
        let characterImage = UIImageView()
        characterImage.contentMode = .scaleAspectFit
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        
        guard let imageURL = URL(string: character.image)
        else { return }
        characterImage.kf.setImage(with: imageURL)
        
        // Creating the portrayed by view
        let portrayedBy = makeLabel(title: "Portrayed by:", detail: character.portrayed)
        
        // Creating the nickname view
        let nickname = makeLabel(title: "Nickname:", detail: character.nickname)
        
        
        // Creating the status view
        let status = makeLabel(title: "Status:", detail: character.status)
        
        // Creating the birthday view
        let birthday = makeLabel(title: "Birthday:", detail: character.birthday)
        
        // Creating the appearances view
        let seasons = character.appearance
            .map { String($0) }
            .joined(separator: ", ")
        
        let appearances = makeLabel(title: "Season appearances", detail: seasons)
        
        // Adding views to main stack view
        stackView.addArrangedSubview(characterImage)
        stackView.addArrangedSubview(portrayedBy)
        stackView.addArrangedSubview(nickname)
        stackView.addArrangedSubview(status)
        stackView.addArrangedSubview(birthday)
        stackView.addArrangedSubview(appearances)
        
        // Setting constraints
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            characterImage.heightAnchor.constraint(equalTo: characterImage.widthAnchor, multiplier: 1),
            
            portrayedBy.topAnchor.constraint(equalTo: characterImage.bottomAnchor),
            portrayedBy.heightAnchor.constraint(equalToConstant: 32),
            portrayedBy.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            portrayedBy.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            nickname.topAnchor.constraint(equalTo: portrayedBy.bottomAnchor),
            nickname.heightAnchor.constraint(equalToConstant: 32),
            nickname.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            nickname.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            status.topAnchor.constraint(equalTo: nickname.bottomAnchor),
            status.heightAnchor.constraint(equalToConstant: 32),
            status.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            status.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            birthday.topAnchor.constraint(equalTo: status.bottomAnchor),
            birthday.heightAnchor.constraint(equalToConstant: 32),
            birthday.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            birthday.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            appearances.topAnchor.constraint(equalTo: status.bottomAnchor),
            appearances.heightAnchor.constraint(equalToConstant: 32),
            appearances.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            appearances.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),

        ])
        
    }
    
    /// Makes a label with a title and a detail placed inside a horizontal stack view
    /// - Parameters:
    ///   - title: The title of the label
    ///   - detail: The content of the label
    /// - Returns: The stack view containing the labels
    func makeLabel(title: String, detail: String) -> UIView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        let detailLabel = UILabel()
        detailLabel.font = .boldSystemFont(ofSize: 16)
        detailLabel.textColor = .label
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.text = detail
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailLabel)
        
        return stackView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = character.name
        navigationItem.largeTitleDisplayMode = .never
        
        print(character!)
        
        
    }
}
