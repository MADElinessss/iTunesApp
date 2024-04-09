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

class SearchViewController: BaseViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    enum SearchState {
        case initial
        case searched
    }
    
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
        // searchController.searchBar.delegate = self
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
            .do(onNext: { apps in
                print("검색 결과 데이터: \(apps.count)개")
            })
            .bind(to: mainView.searchResultsTableView.rx.items(cellIdentifier: SearchTableViewCell.identifier, cellType: SearchTableViewCell.self)) { [self] (row, element, cell) in
                
                self.mainView.searchResultsTableView.isHidden = false
                self.mainView.recentSearchesTableView.isHidden = true
                
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
        
        output.searchTerms
            .do(onNext: { terms in
                print("최근 검색어 데이터: \(terms)")
            })
            .bind(to: mainView.recentSearchesTableView.rx.items) { (tableView, row, element) -> UITableViewCell in
                let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTermCell") ?? UITableViewCell(style: .default, reuseIdentifier: "SearchTermCell")
                cell.textLabel?.text = element
                return cell
            }
            .disposed(by: disposeBag)
        
        Observable.zip(
            mainView.searchResultsTableView.rx.modelSelected(
                AppInfo.self
            ),
            mainView.searchResultsTableView.rx.itemSelected
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
        // guard let searchText = searchController.searchBar.text, !searchText.isEmpty else { return }
        //viewModel.search(for: searchText)
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("검색 시작됨")
        // viewModel.updateSearchState(.searched)
        if let searchText = searchBar.text, !searchText.isEmpty {
            viewModel.search(for: searchText)
        }
        
        mainView.searchResultsTableView.isHidden = false
        mainView.recentSearchesTableView.isHidden = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("검색 취소됨")
        viewModel.updateSearchState(.initial)
        mainView.searchResultsTableView.isHidden = true
        mainView.recentSearchesTableView.isHidden = false
    }
    func configure() {
        mainView.searchResultsTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }

        mainView.recentSearchesTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(44)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
