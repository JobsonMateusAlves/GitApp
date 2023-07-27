//
//  UserDetailViewController.swift
//  
//
//  Created by Jobson Mateus on 26/07/23.
//

import UIKit

public class UserDetailViewController: UIViewController {

    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}
