//
//  SearchTitleViewViewController.swift
//  iTunesApp
//
//  Created by Madeline on 4/8/24.
//

import UIKit

class SearchTitleViewViewController: BaseViewController, UISearchBarDelegate {
    
    let titleLabel = UILabel()
    let searchBar = {
        let view = UISearchBar()
        view.placeholder = "게임, 앱, 스토리 등"
        view.showsCancelButton = true
        
        return view
    }()
    let tableView = UITableView()
    
    var searchTerms: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        fetchSearchTerms()
        configure()
        fetchSearchTerms()
    }
    
    private func configure() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        navigationItem.searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController?.searchBar.placeholder = "게임, 앱, 스토리 등"
        navigationItem.searchController?.searchBar.delegate = self
        
        tableView.backgroundColor = .white
        tableView.rowHeight = UIScreen.main.bounds.height * 0.4
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalTo(view)
        }
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let searchVC = SearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    private func fetchSearchTerms() {
        searchTerms = UserDefaultsManager.shared.getSearchTerms()
        tableView.isHidden = searchTerms.isEmpty
        tableView.reloadData()
    }
    
    private func configureNavigationBar() {
            title = "검색"
            navigationController?.navigationBar.prefersLargeTitles = true
        }
}

extension SearchTitleViewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchTerms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = searchTerms[indexPath.row]
        cell.textLabel?.textColor = .systemGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchTerm = searchTerms[indexPath.row]
        let vc = SearchViewController()
        vc.hidesBackButton = true
        navigationController?.pushViewController(vc, animated: true)
        vc.setSearchTerm(searchTerm)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
