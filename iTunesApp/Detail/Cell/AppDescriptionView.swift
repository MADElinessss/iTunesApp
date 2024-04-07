//
//  AppDescriptionView.swift
//  iTunesApp
//
//  Created by Madeline on 4/7/24.
//

import UIKit

class AppDescriptionView: BaseView {

    let descriptionLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.textColor = .black
        view.numberOfLines = 0
        return view
    }()
    
    override func configureView() {
        addSubview(descriptionLabel)
    }
    
    override func configureHierarchy() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
