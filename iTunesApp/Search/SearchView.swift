//
//  SearchView.swift
//  iTunesApp
//
//  Created by Madeline on 4/6/24.
//

import SnapKit
import UIKit

class SearchView: BaseView {

    let searchBar = {
        let view = UISearchBar()
        view.placeholder = "게임, 앱, 스토리 등"
        view.showsCancelButton = true
        
        return view
    }()
    
    let tableView: UITableView = {
       let view = UITableView()
        view.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        view.backgroundColor = .white
        view.rowHeight = 180
        view.separatorStyle = .none
       return view
     }()
    
    override func configureHierarchy() {
        addSubview(searchBar)
        addSubview(tableView)
    }
    
    override func configureView() {
        
    }
    

}
