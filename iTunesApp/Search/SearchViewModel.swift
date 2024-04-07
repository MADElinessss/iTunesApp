//
//  SearchViewModel.swift
//  iTunesApp
//
//  Created by Madeline on 4/6/24.
//

import Foundation
import RxCocoa
import RxSwift

class SearchViewModel: ViewModelType {
    var disposeBag = DisposeBag()
    
    struct Input {
        let searchButtonTapped: ControlEvent<Void>
        let searchText: ControlProperty<String>
    }
    
    struct Output {
        let apps: PublishSubject<[AppInfo]>
    }
    
    func transform(_ input: Input) -> Output {
        
        let appList = PublishSubject<[AppInfo]>()
        
        input.searchButtonTapped
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .withLatestFrom(input.searchText)
            .distinctUntilChanged() // 중복 막아
            .flatMap {
                APIManager.shared.fetchiTunesSearchResults(term: $0)
            }
            .subscribe(with: self) { owner, term in
                appList.onNext(term)
            }
            .disposed(by: disposeBag)
        
        return Output(apps: appList)
    }
}
