//
//  CharactersTableViewCell.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 10/06/21.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {

    static let identifier = String(describing: type(of: self))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(character: Character) {
        self.textLabel?.text = character.fullName
        self.imageView?.downloaded(from: character.imageUrl.serie)
    }

}
