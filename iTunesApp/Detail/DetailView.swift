//
//  DetailView.swift
//  iTunesApp
//
//  Created by Madeline on 4/7/24.
//

import SnapKit
import RxCocoa
import RxSwift
import UIKit

class DetailView: BaseView {

    let scrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
    
    let appNameView = AppNameView()
    let appVersionView = AppVersionView()
    let appImageView = AppImageView()
    let appDescriptionView = UIView()
    
    override func configureView() {
        addSubview(scrollView)
        
        scrollView.addSubview(appNameView)
        scrollView.addSubview(appVersionView)
        scrollView.addSubview(appImageView)
        scrollView.addSubview(appDescriptionView)
        
    }
    
    override func configureHierarchy() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        appNameView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height * 0.15)
        }
        appVersionView.snp.makeConstraints { make in
            make.top.equalTo(appNameView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height * 0.3)
        }
        appImageView.snp.makeConstraints { make in
            make.top.equalTo(appVersionView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height * 0.45)
        }
        appDescriptionView.snp.makeConstraints { make in
            make.top.equalTo(appImageView.snp.bottom)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
