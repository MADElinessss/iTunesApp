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
    
    var disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
     
    // MARK: Cell 재사용 막기 ⭐️
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
