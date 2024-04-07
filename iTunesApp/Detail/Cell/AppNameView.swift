//
//  AppNameView.swift
//  iTunesApp
//
//  Created by Madeline on 4/7/24.
//

import SnapKit
import UIKit

class AppNameView: BaseView {

    let appIconImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.cornerRadius = 16
        return view
    }()
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let artistLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .lightGray
        return label
    }()
    
    let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.isUserInteractionEnabled = true
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        return button
    }()
    
    override func configureView() {
        addSubview(appIconImageView)
        addSubview(appNameLabel)
        addSubview(artistLabel)
        addSubview(downloadButton)
    }
    
    override func configureHierarchy() {
        appIconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalTo(20)
            $0.size.equalTo(100)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(12)
        }
        
        artistLabel.snp.makeConstraints {
            $0.top.equalTo(appNameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(12)
        }
        
        downloadButton.snp.makeConstraints {
            $0.top.equalTo(artistLabel.snp.bottom).offset(8)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(12)
            $0.height.equalTo(30)
            $0.width.equalTo(72)
        }
        
    }
}
