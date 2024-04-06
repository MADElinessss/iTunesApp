//
//  SearchTableViewCell.swift
//  iTunesApp
//
//  Created by Madeline on 4/7/24.
//

import UIKit
import RxSwift
import RxCocoa

class SearchTableViewCell: BaseTableViewCell {
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemMint
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.isUserInteractionEnabled = true
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 16
        return button
    }()
    
    let starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .systemBlue
        imageView.image = UIImage(systemName: "star.fill")
        return imageView
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    let artistLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    var disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
     
    // MARK: Cell 재사용 막기 ⭐️
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        contentView.addSubview(appNameLabel)
        contentView.addSubview(appIconImageView)
        contentView.addSubview(downloadButton)
        contentView.addSubview(starImage)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(artistLabel)
        
        appIconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalTo(20)
            $0.size.equalTo(60)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(28)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(12)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-12)
        }
        
        downloadButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
            $0.width.equalTo(72)
        }
        
        starImage.snp.makeConstraints {
            $0.top.equalTo(appIconImageView.snp.bottom).offset(8)
            $0.leading.equalTo(20)
            $0.size.equalTo(20)
        }
        
        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(appIconImageView.snp.bottom).offset(12)
            $0.leading.equalTo(appIconImageView.snp.trailing).inset(30)
        }
        
        artistLabel.snp.makeConstraints {
            $0.top.equalTo(appIconImageView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
    }
}
