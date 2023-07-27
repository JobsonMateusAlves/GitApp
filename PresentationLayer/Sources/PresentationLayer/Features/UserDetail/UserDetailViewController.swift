//
//  UserDetailViewController.swift
//  
//
//  Created by Jobson Mateus on 26/07/23.
//

import UIKit
import DomainLayer

public protocol UserDetail {

}

public class UserDetailViewController: UIViewController {

    let userImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .blue
        return imageView
    }()

    let nameStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()

    let nameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    let loginLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    let bioLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    let locationLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    let followersStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()

    let followersLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    let followingLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    let urlButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    private let viewModel: UserDetailViewModel
    private let coordinator: (UserDetail & Coordinator)
    
    private let imageLoader: ImageLoader = ImageLoader()

    public init(viewModel: UserDetailViewModel, coordinator: (UserDetail & Coordinator)) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupButton()
        loadData()
    }

    func setupButton() {
        urlButton.addTarget(self, action: #selector(openUserHtmlUrl), for: .touchUpInside)
    }

    func loadData() {
        viewModel.getUser() { [weak self] in
            self?.setContent()
        }
    }

    func setContent() {
        let user: User = viewModel.user
        nameLabel.text = "Jobson Mateus"
        loginLabel.text = "JobsonMateusAlves"
        bioLabel.text = "iOS Developer"
        locationLabel.text = "Fortaleza"
        followersLabel.text = "\(user.followers) seguidores"
        followingLabel.text = "\(user.following) seguindo"
        urlButton.setTitle(user.htmlUrl, for: .normal)

        if let url = URL(string: user.avatarUrl) {
            imageLoader.loadImage(with: url) { [weak self] image in
                self?.userImageView.setImage(image: image)
            }
        }
    }

    @objc func openUserHtmlUrl() {
        if let url = URL(string: viewModel.user.htmlUrl) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension UserDetailViewController {
    func setupLayout() {
        setupUserImageViewLayout()
        setupNameStackViewLayout()
        setupBioLabelLayout()
        setupLocationLabelLayout()
        setupFollowersStackViewLayout()
        setupurlButtonLayout()

        view.backgroundColor = .black
    }
    
    func setupUserImageViewLayout() {
        view.addSubview(userImageView)
        
        let constraints: [NSLayoutConstraint] = [
            userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            userImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userImageView.heightAnchor.constraint(equalToConstant: 60),
            userImageView.widthAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        view.layoutIfNeeded()

        userImageView.layer.cornerRadius = userImageView.frame.height / 2
        userImageView.layer.borderColor = UIColor.white.cgColor
        userImageView.layer.borderWidth = 2
    }

    func setupNameStackViewLayout() {
        view.addSubview(nameStackView)

        let constraints: [NSLayoutConstraint] = [
            nameStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameStackView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 16),
            nameStackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16)
        ]

        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(loginLabel)
        
        NSLayoutConstraint.activate(constraints)
    }

    func setupBioLabelLayout() {
        view.addSubview(bioLabel)

        let constraints: [NSLayoutConstraint] = [
            bioLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 16),
            bioLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

    func setupLocationLabelLayout() {
        view.addSubview(locationLabel)

        let constraints: [NSLayoutConstraint] = [
            locationLabel.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 16),
            locationLabel.leadingAnchor.constraint(equalTo: bioLabel.leadingAnchor),
            locationLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

    func setupFollowersStackViewLayout() {
        view.addSubview(followersStackView)

        let constraints: [NSLayoutConstraint] = [
            followersStackView.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 16),
            followersStackView.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor),
            followersStackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16)
        ]

        followersStackView.addArrangedSubview(followersLabel)
        followersStackView.addArrangedSubview(followingLabel)
        
        NSLayoutConstraint.activate(constraints)
    }

    func setupurlButtonLayout() {
        view.addSubview(urlButton)

        let constraints: [NSLayoutConstraint] = [
            urlButton.topAnchor.constraint(equalTo: followersStackView.bottomAnchor, constant: 16),
            urlButton.leadingAnchor.constraint(equalTo: followersStackView.leadingAnchor),
            urlButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

