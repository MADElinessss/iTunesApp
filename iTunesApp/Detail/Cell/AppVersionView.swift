//
//  AppVersionView.swift
//  iTunesApp
//
//  Created by Madeline on 4/7/24.
//

import SnapKit
import UIKit

class AppVersionView: BaseView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 소식"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()

    let versionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override func configureView() {
        addSubview(titleLabel)
        addSubview(versionLabel)
        addSubview(descriptionLabel)
    }
    
    override func configureHierarchy() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().offset(20)
        }
        
        versionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(20)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(versionLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().offset(20)
        }
    }
}
