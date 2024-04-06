//
//  BaseTableViewCell.swift
//  iTunesApp
//
//  Created by Madeline on 4/7/24.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    // 클래스 변수를 추가하여 클래스 이름을 식별자로 사용
    static var identifier: String {
        return String(describing: self)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
