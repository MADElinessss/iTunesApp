//
//  ViewModelType.swift
//  iTunesApp
//
//  Created by Madeline on 4/6/24.
//

import Foundation
import RxSwift

protocol ViewModelType {
    
    var disposeBag: DisposeBag { get }
    
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}
