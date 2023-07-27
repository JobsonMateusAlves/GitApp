//
//  LoadingViewController.swift
//  
//
//  Created by Jobson Mateus on 26/07/23.
//

import UIKit

class LoadingView: UIView {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        loadingIndicator.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension LoadingView {
    func setupLayout() {
        setupBackgroundViewLayout()
        setupLoadingIndicatorLayout()
        backgroundColor = .clear
    }
    
    func setupBackgroundViewLayout() {
        addSubview(backgroundView)
        
        let constraints: [NSLayoutConstraint] = [
            backgroundView.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroundView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 80),
            backgroundView.widthAnchor.constraint(equalToConstant: 80)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupLoadingIndicatorLayout() {
        addSubview(loadingIndicator)
        
        let constraints: [NSLayoutConstraint] = [
            loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingIndicator.heightAnchor.constraint(equalToConstant: 60),
            loadingIndicator.widthAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
