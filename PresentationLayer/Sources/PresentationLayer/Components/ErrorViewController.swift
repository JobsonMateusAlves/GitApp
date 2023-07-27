//
//  ErrorViewController.swift
//  
//
//  Created by Jobson Mateus on 26/07/23.
//

import UIKit

class ErrorViewController: UIViewController {
    
    let errorLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let backgroundView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 16
        return view
    }()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ErrorViewController {
    func setupLayout() {
        setupBackgroundViewLayout()
        setupErrorLabelLayout()
    }
    
    func setupBackgroundViewLayout() {
        view.addSubview(backgroundView)
        
        let constraints: [NSLayoutConstraint] = [
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 100),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupErrorLabelLayout() {
        backgroundView.addSubview(errorLabel)
        
        let constraints: [NSLayoutConstraint] = [
            errorLabel.topAnchor.constraint(greaterThanOrEqualTo: backgroundView.topAnchor, constant: 16),
            errorLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 16),
            errorLabel.trailingAnchor.constraint(lessThanOrEqualTo: backgroundView.trailingAnchor, constant: -16),
            errorLabel.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            errorLabel.bottomAnchor.constraint(lessThanOrEqualTo: backgroundView.bottomAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
