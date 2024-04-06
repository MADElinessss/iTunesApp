//
//  BaseViewController.swift
//  iTunesApp
//
//  Created by Madeline on 4/6/24.
//

import RxCocoa
import RxSwift
import UIKit

class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        bind()
    }
    
    func bind() { }
}
