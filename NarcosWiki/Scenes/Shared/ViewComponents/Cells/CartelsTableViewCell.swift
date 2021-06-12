//
//  CartelsTableViewCell.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 12/06/21.
//

import UIKit

class CartelsTableViewCell: UITableViewCell {

    static let identifier = String(describing: type(of: self))

    lazy var cartelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = nil
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.image = UIImage(color: .gray, size: CGSize(width: 50, height: 50))
        return imageView
    }()
    
    lazy var cartelNameLabel: UILabel = {
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
        self.addSubview(cartelImageView)
        self.addSubview(cartelNameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cartelImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cartelImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cartelImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            cartelImageView.heightAnchor.constraint(equalToConstant: 50),
            cartelImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            cartelNameLabel.leadingAnchor.constraint(equalTo: cartelImageView.trailingAnchor, constant: 16),
            cartelNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cartelNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(cartel: Cartel) {
        self.cartelNameLabel.text = cartel.name
        
        let gradient = CAGradientLayer()
        gradient.colors = UIColor.colorByCartels(cartel: Cartels(rawValue: cartel.name ?? "") ?? .tijuana)
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(origin: .zero, size: cartelImageView.image?.size ?? .zero)
        cartelImageView.layer.insertSublayer(gradient, at: 1)
    }

}

extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}


extension UIColor {
    static func colorByCartels(cartel: Cartels) -> [CGColor] {
        switch cartel {
        case .guadalajara:
            return [UIColor.blue.cgColor, UIColor.red.cgColor]
        case .sinaloa:
            return [UIColor.red.cgColor, UIColor.darkGray.cgColor]
        case .juarez:
            return [UIColor.magenta.cgColor, UIColor.orange.cgColor]
        case .gulf:
            return [UIColor.black.cgColor, UIColor.lightGray.cgColor]
        case .tijuana:
            return [UIColor.cyan.cgColor, UIColor.brown.cgColor]
        }
    }
}
