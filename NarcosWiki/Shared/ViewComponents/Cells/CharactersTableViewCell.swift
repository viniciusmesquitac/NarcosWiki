//
//  CharactersTableViewCell.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 10/06/21.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {

    static let identifier = String(describing: type(of: self))
    
    lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.image = UIImage.placeholder
        imageView.tintColor = .systemBlue
        imageView.alpha = 0.5
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func buildViewHierarchy() {
        self.addSubview(characterImageView)
        self.addSubview(nameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            characterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            characterImageView.heightAnchor.constraint(equalToConstant: 50),
            characterImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(character: Character) {
        self.nameLabel.text = character.fullName
        self.characterImageView.downloaded(from: character.imageUrl.serie) {
            self.characterImageView.rounded()
            self.setNeedsLayout()
        }
    }

}
