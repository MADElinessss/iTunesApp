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
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    let screenshotsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        return stackView
    }()
    
    var disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureScreenshots()
    }
     
    // MARK: Cell 재사용 막기 ⭐️
    override func prepareForReuse() {
        super.prepareForReuse()
        appIconImageView.image = nil // 또는 기본 이미지로 설정
        // 스크린샷 이미지 뷰들도 초기화
        screenshotsStackView.arrangedSubviews.forEach { imageView in
            if let imageView = imageView as? UIImageView {
                imageView.image = nil
            }
        }
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
        contentView.addSubview(genreLabel)
        
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
        
        genreLabel.snp.makeConstraints {
            $0.top.equalTo(appIconImageView.snp.bottom).offset(8)
            $0.trailing.equalTo(-20)
        }
    }
    
    private func configureScreenshots() {
        for _ in 0..<3 {
            let screenshotImageView = UIImageView()
            screenshotImageView.contentMode = .scaleAspectFill
            screenshotImageView.backgroundColor = .white
            screenshotImageView.clipsToBounds = true
            screenshotImageView.layer.cornerRadius = 10
            screenshotsStackView.addArrangedSubview(screenshotImageView)
        }
        
        contentView.addSubview(screenshotsStackView)
    
        screenshotsStackView.snp.makeConstraints { make in
            make.top.equalTo(starImage.snp.bottom).offset(12)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(200)
        }
    }
}
