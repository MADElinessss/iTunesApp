//
//  SearchViewController.swift
//  iTunesApp
//
//  Created by Madeline on 4/6/24.
//

import Kingfisher
import SnapKit
import RxCocoa
import RxSwift
import UIKit

class SearchViewController: BaseViewController, UISearchResultsUpdating {
    
    let mainView = SearchView()
    let viewModel = SearchViewModel()
    var searchController = UISearchController(searchResultsController: nil)
    var hidesBackButton: Bool = false
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureNavigationBar()
        
        if hidesBackButton {
            navigationItem.hidesBackButton = true
        }
        
        setupSearchController()
        
    }
    
    private func configureNavigationBar() {
        title = "검색"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "게임, 앱, 스토리 등"
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    override func bind() {
        
        let input = SearchViewModel.Input(
            searchButtonTapped: searchController.searchBar.rx.searchButtonClicked,
            searchText: searchController.searchBar.rx.text.orEmpty
        )
        
        let output = viewModel.transform(input)
        
        output.apps
            .bind(to: mainView.tableView.rx.items(cellIdentifier: SearchTableViewCell.identifier, cellType: SearchTableViewCell.self)) { (row, element, cell) in
                cell.appNameLabel.text = "\(element.trackName)"
                let url = URL(string: element.artworkUrl100)
                cell.appIconImageView.kf.setImage(with: url)
                cell.artistLabel.text = "\(element.artistName)"
                let rating = DateFormatterManager.shared.string(from: element.averageUserRating ?? 0.0)
                cell.ratingLabel.text = rating
                if let genre = element.genres.first {
                    cell.genreLabel.text = "\(genre)"
                }
                
                element.screenshotUrls.prefix(3).enumerated().forEach { index, screenshotUrl in
                    if let url = URL(string: screenshotUrl), let screenshotImageView = cell.screenshotsStackView.arrangedSubviews[index] as? UIImageView {
                        screenshotImageView.kf.setImage(with: url)
                    }
                }
            }
            .disposed(by: disposeBag)

        Observable.zip(
            mainView.tableView.rx.modelSelected(
                AppInfo.self
            ),
            mainView.tableView.rx.itemSelected
        )
        .map { $0.0 }
        .subscribe(with: self) { owner, app in
            let vc = DetailViewController()
            vc.appInfo = app
            self.navigationController?.pushViewController(vc, animated: true)
        }
        .disposed(by: disposeBag)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func configure() {
        mainView.tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
}
