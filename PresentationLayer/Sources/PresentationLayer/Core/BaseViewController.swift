//
//  BaseViewController.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import UIKit

public class BaseViewController: UIViewController {

    let loadingView: LoadingView = {
        let loadingView: LoadingView = LoadingView(frame: .zero)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.alpha = 0
        return loadingView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupBaseLayout()
    }
    
    func startLoading() {
        view.bringSubviewToFront(loadingView)
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.loadingView.alpha = 1
        }
    }
    
    func stopLoading() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.loadingView.alpha = 0
        }
    }
}

extension BaseViewController {
    func setupBaseLayout() {
        setupLoadingViewLayout()
    }
    
    func setupLoadingViewLayout() {
        view.addSubview(loadingView)
        
        let constraints: [NSLayoutConstraint] = [
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.heightAnchor.constraint(equalToConstant: 80),
            loadingView.widthAnchor.constraint(equalToConstant: 80)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
