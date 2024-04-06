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

class SearchViewController: BaseViewController {
    
    let mainView = SearchView()
    let viewModel = SearchViewModel()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
    }
    
    override func bind() {
        
        let input = SearchViewModel.Input(searchButtonTapped: mainView.searchBar.rx.searchButtonClicked, searchText: mainView.searchBar.rx.text.orEmpty)
        
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
        
    }
    
    func configure() {
        navigationItem.titleView = mainView.searchBar
        
        mainView.tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
}
