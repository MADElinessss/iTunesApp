//
//  SearchViewController.swift
//  iTunesApp
//
//  Created by Madeline on 4/6/24.
//

import SnapKit
import RxCocoa
import RxSwift
import UIKit

class SearchViewController: BaseViewController {
    
    let mainView = SearchView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = mainView.searchBar
        mainView.searchBar.delegate = self
    }
    
    override func bind() {
        
        
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchApps(searchTerm: searchBar.text!)
    }
}

extension SearchViewController {
    // temporary
    private func fetchApps(searchTerm: String) {
        APIManager.fetchiTunesSearchResults(term: searchTerm) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let apps):
                    for app in apps {
                        print("App Name: \(app.trackName), Developer: \(app.artistName)")
                    }
                case .failure(let error):
                    print("Error fetching apps: \(error)")
                }
            }
        }
    }
}
