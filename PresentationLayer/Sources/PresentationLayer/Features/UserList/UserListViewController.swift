//
//  UserListViewController.swift
//  
//
//  Created by Jobson Mateus on 26/07/23.
//

import UIKit
import DomainLayer

public protocol UserList {
    func startUserDetailFlow(user: User)
}

public class UserListViewController: BaseViewController {
    
    let tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.separatorColor = .darkGray
        return tableView
    }()
    
    let searchController: UISearchController = {
        let searchControler: UISearchController = UISearchController(searchResultsController: nil)
        return searchControler
    }()
    
    private let viewModel: UserListViewModel
    private let coordinator: (UserList & Coordinator)
    private var debounceTimer: Timer?
    private let debounceDelay: TimeInterval = 1
    
    public init(viewModel: UserListViewModel, coordinator: (UserList & Coordinator)) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Users"
        
        setupNavigationBar()
        setupLayout()
        setupTableView()
        setupSearchController()
        loadData()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .black
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Pesquisar"
        searchController.searchBar.barTintColor = .black
        searchController.searchBar.tintColor = .white
        searchController.searchBar.searchTextField.textColor = .white
        searchController.searchBar.sizeToFit()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserTableViewCell")
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func loadData() {
        startLoading()
        viewModel.getUsers(isFirstPage: true) { [weak self] in
            self?.tableView.reloadData()
            self?.stopLoading()
        }
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfUsers
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        cell.bind(user: viewModel.userAt(index: indexPath.row))
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchController.isActive = false
        
        coordinator.startUserDetailFlow(user: viewModel.userAt(index: indexPath.row))
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.numberOfUsers - 1 {
            paginate()
        }
    }
    
    func paginate() {
        startLoading()
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            viewModel.searchUsers(searchText: searchText, isFirstPage: false) { [weak self] in
                self?.tableView.reloadData()
                self?.stopLoading()
            }
        } else {
            viewModel.getUsers(isFirstPage: false) { [weak self] in
                self?.tableView.reloadData()
                self?.stopLoading()
            }
        }
    }
}

extension UserListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    public func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            debounceTimer?.invalidate()
            
            debounceTimer = Timer.scheduledTimer(withTimeInterval: debounceDelay, repeats: false) { [weak self] _ in
                self?.search(searchText: searchText)
            }
            
        } else if viewModel.isSearching {
            loadData()
        }
    }
    
    func search(searchText: String) {
        startLoading()
        viewModel.searchUsers(searchText: searchText, isFirstPage: true) { [weak self] in
            self?.tableView.reloadData()
            self?.stopLoading()
        }
    }
}

extension UserListViewController {
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

