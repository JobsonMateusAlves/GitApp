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
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    let pageLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()
    
    let userImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let imageLoader: ImageLoader = ImageLoader()

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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageLoader.cancel()
    }
    
    func bind(user: User) {
        nameLabel.text = user.login
        pageLabel.text = user.htmlUrl
        if let url = URL(string: user.avatarUrl) {
            imageLoader.loadImage(with: url) { [weak self] image in
                self?.userImageView.setImage(image: image)
            }
        }
    }
}

extension UserTableViewCell {
    func setupLayout() {
        setupUserImageViewLayout()
        setupStackViewLayout()
        
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    func setupUserImageViewLayout() {
        addSubview(userImageView)

        let constraints: [NSLayoutConstraint] = [
            userImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userImageView.heightAnchor.constraint(equalToConstant: 60),
            userImageView.widthAnchor.constraint(equalToConstant: 60)
        ]

        NSLayoutConstraint.activate(constraints)
        
        layoutIfNeeded()
        
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
        userImageView.layer.borderColor = UIColor.white.cgColor
        userImageView.layer.borderWidth = 2
    }
    
    func setupStackViewLayout() {
        addSubview(stackView)

        let constraints: [NSLayoutConstraint] = [
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16)
        ]

        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(pageLabel)
        
        NSLayoutConstraint.activate(constraints)
    }
}
