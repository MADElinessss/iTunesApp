//
//  DetailViewModel.swift
//  iTunesApp
//
//  Created by Madeline on 4/7/24.
//

import Foundation
import RxCocoa
import RxSwift

class DetailViewModel: ViewModelType {
    var disposeBag = DisposeBag ()
    
    private let appInfoSubject = BehaviorSubject<AppInfo?>(value: nil)
    
    struct Input {
        //let viewWillAppear: Observable<Void>
    }
    
    struct Output {
        //let appInfo: Observable<AppInfo?>
    }
    
    func transform(_ input: Input) -> Output {
//        let appInfo = Observable<AppInfo>()
//        input.viewWillAppear
//            .bind(with: self) { owner, _ in
//                appInfo.onNext(appInfoSubject)
//            }
//            .disposed(by: disposeBag)
//        
        return Output()
    }
    
    func setAppInfo(_ appInfo: AppInfo) {
        appInfoSubject.onNext(appInfo)
    }
}
