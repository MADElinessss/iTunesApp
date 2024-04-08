//
//  SearchView.swift
//  iTunesApp
//
//  Created by Madeline on 4/6/24.
//

import SnapKit
import UIKit

class SearchView: BaseView {
    
    let tableView: UITableView = {
       let view = UITableView()
        view.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        view.backgroundColor = .white
        view.rowHeight = UIScreen.main.bounds.height * 0.4
        view.separatorStyle = .none
       return view
     }()
    
    
    override func configureHierarchy() {
        addSubview(tableView)
    }
    
    override func configureView() {
        
    }

}
