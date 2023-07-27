//
//  RepoTableViewCell.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import UIKit
import DomainLayer

class RepoTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    let languageLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(repo: Repo) {
        nameLabel.text = repo.name
        languageLabel.text = "Language: \(repo.language)"
    }
}

extension RepoTableViewCell {
    func setupLayout() {
        setupNameLabelLayout()
        setupLanguageLabelLayout()
        
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    func setupNameLabelLayout() {
        addSubview(nameLabel)

        let constraints: [NSLayoutConstraint] = [
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
    func setupLanguageLabelLayout() {
        addSubview(languageLabel)

        let constraints: [NSLayoutConstraint] = [
            languageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            languageLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            languageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            languageLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
