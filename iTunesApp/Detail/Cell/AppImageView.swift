//
//  AppImageView.swift
//  iTunesApp
//
//  Created by Madeline on 4/7/24.
//

import UIKit

class AppImageView: BaseView {

    let collectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func configureView() {
        addSubview(collectionView)
    }
    
    override func configureHierarchy() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    static func layout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 250)
        layout.scrollDirection = .horizontal
        return layout
    }
}
