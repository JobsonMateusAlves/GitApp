//
//  File.swift
//  
//
//  Created by Jobson Mateus on 26/07/23.
//

import UIKit

extension UIViewController {

    
    func showError(error: String) {
        let errorController: ErrorViewController = ErrorViewController()
        errorController.modalPresentationStyle = .overFullScreen
        errorController.modalTransitionStyle = .crossDissolve
        errorController.errorLabel.text = error
        navigationController?.present(errorController, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            if let _ = self?.navigationController?.visibleViewController as? ErrorViewController {
                self?.navigationController?.dismiss(animated: true)
            }
        }
    }
}
