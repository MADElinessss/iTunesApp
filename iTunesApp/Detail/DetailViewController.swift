//
//  DetailViewController.swift
//  iTunesApp
//
//  Created by Madeline on 4/7/24.
//

import Kingfisher
import SnapKit
import RxCocoa
import RxSwift
import UIKit

class DetailViewController: BaseViewController {
    
    //app 받아서 뷰에 띄워
    let mainView = DetailView()
    let viewModel = DetailViewModel()
    
    var appInfo: AppInfo?
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        if let app = appInfo {
            let url = URL(string: app.artworkUrl100)
            mainView.appNameView.appIconImageView.kf.setImage(with: url)
            mainView.appNameView.appNameLabel.text = app.trackName
            mainView.appNameView.artistLabel.text = app.artistName
            
            mainView.appVersionView.versionLabel.text = "버전 " + app.version
            mainView.appVersionView.descriptionLabel.text = app.releaseNotes
            
            let screenshotURLs = app.screenshotUrls.compactMap { URL(string: $0) }
            mainView.appImageView.imageURLs = screenshotURLs
            mainView.appDescriptionView.descriptionLabel.text = app.description
        }
    }

    override func bind() {
       
    }
    
}
