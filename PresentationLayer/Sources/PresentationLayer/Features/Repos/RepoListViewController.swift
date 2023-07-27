//
//  RepoListViewController.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import UIKit

public protocol RepoList {
    
}

public class RepoListViewController: BaseViewController {

    let tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.separatorColor = .darkGray
        return tableView
    }()
    
    private let viewModel: RepoListViewModel
    private let coordinator: (RepoList & Coordinator)
    
    public init(viewModel: RepoListViewModel, coordinator: (RepoList & Coordinator)) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Repositórios"
        
        setupLayout()
        setupTableView()
        loadData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RepoTableViewCell.self, forCellReuseIdentifier: "RepoTableViewCell")
    }
    
    func loadData() {
        startLoading()
        viewModel.getRepos(isFirstPage: true) { [weak self] in
            self?.tableView.reloadData()
            self?.stopLoading()
        }
    }
}

extension RepoListViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRepos
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell", for: indexPath) as? RepoTableViewCell else {
            return UITableViewCell()
        }
        cell.bind(repo: viewModel.repoAt(index: indexPath.row))
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.numberOfRepos - 1 {
            paginate()
        }
    }
    
    func paginate() {
        startLoading()
        viewModel.getRepos(isFirstPage: false) { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self?.tableView.reloadData()
                self?.stopLoading()
            }
        }
    }
}

extension RepoListViewController {
    
    func setupLayout() {
        setupTableViewLayout()
        
        view.backgroundColor = .black
    }
    
    func setupTableViewLayout() {
        view.addSubview(tableView)
        
        let constraints: [NSLayoutConstraint] = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
