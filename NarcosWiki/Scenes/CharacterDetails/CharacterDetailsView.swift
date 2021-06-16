//
//  CharacterDetailsView.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 13/06/21.
//

import UIKit

class CharacterDetailsView: UIView, ViewCode {

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var backgroundBlur: UIBlurEffect = {
        return UIBlurEffect(style: .dark)
    }()

    lazy var imageView: UIImageView = {
        return UIImageView()
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        return UISegmentedControl(items: ["Item 1", "Item 2"])
    }()


    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.addRow(title: "Full name", information: "Francisco Rafael")

        self.buildViewHierarchy()
        self.setupConstraints()

    }
    
    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    func setupConstraints() {
        setupScrollViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addRow(title: String, information: String) {
        let row = InformationRowView(title: title, information: information)
        row.width(constant: UIScreen.main.bounds.width)
        stackView.addArrangedSubview(row)
        stackView.layoutIfNeeded()
    }
}

extension CharacterDetailsView {
    func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}

class InformationRowView: UIView, ViewCode {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()

    init(title: String, information: String) {
        super.init(frame: .zero)
        self.backgroundColor = .gray
        buildViewHierarchy()
        setupConstraints()
        titleLabel.text = title
        informationLabel.text = information
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(informationLabel)
    }
    
    func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            informationLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 6),
            informationLabel.topAnchor.constraint(equalTo: topAnchor),
            informationLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            informationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
}
