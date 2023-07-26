//
//  UserTableViewCell.swift
//  
//
//  Created by Jobson Mateus on 26/07/23.
//

import UIKit
import DomainLayer

class UserTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let userImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    }
    
    func bind(user: User) {
        nameLabel.text = user.login
    }
}

extension UserTableViewCell {
    func setupLayout() {
        setupUserImageViewLayout()
        setupNameLabelLayout()
    }
    
    func setupUserImageViewLayout() {
        addSubview(userImageView)

        let constraints: [NSLayoutConstraint] = [
            userImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userImageView.heightAnchor.constraint(equalToConstant: 80),
            userImageView.widthAnchor.constraint(equalToConstant: 80)
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
    func setupNameLabelLayout() {
        addSubview(nameLabel)

        let constraints: [NSLayoutConstraint] = [
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
