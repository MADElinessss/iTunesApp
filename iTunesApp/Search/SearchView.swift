//
//  SearchView.swift
//  iTunesApp
//
//  Created by Madeline on 4/6/24.
//

import SnapKit
import UIKit

class SearchView: BaseView {
    
    let searchResultsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        tableView.backgroundColor = .white
        tableView.rowHeight = UIScreen.main.bounds.height * 0.4
        return tableView
    }()
    
    let recentSearchesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SearchTermCell")
        tableView.backgroundColor = .white
        tableView.rowHeight = 44
        return tableView
    }()
    
    override func configureHierarchy() {
        addSubview(searchResultsTableView)
        addSubview(recentSearchesTableView)
        
        searchResultsTableView.isHidden = true
        recentSearchesTableView.isHidden = false
    }
    
    override func configureView() {
        
    }
    
}
