//
//  LoadingViewController.swift
//  
//
//  Created by Jobson Mateus on 26/07/23.
//

import UIKit

class LoadingViewController: UIViewController {
    
    let loadingIndicator: UIActivityIndicatorView = {
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.color = .blue
        return loadingIndicator
    }()
    
    let backgroundView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
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
        setupLayout()
        loadingIndicator.startAnimating()
    }
}

extension LoadingViewController {
    func setupLayout() {
        setupBackgroundViewLayout()
        setupLoadingIndicatorLayout()
        view.backgroundColor = .clear
    }
    
    func setupBackgroundViewLayout() {
        view.addSubview(backgroundView)
        
        let constraints: [NSLayoutConstraint] = [
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 80),
            backgroundView.widthAnchor.constraint(equalToConstant: 80)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupLoadingIndicatorLayout() {
        view.addSubview(loadingIndicator)
        
        let constraints: [NSLayoutConstraint] = [
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.heightAnchor.constraint(equalToConstant: 60),
            loadingIndicator.widthAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
