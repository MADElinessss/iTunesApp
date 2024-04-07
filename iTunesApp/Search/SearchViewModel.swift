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
    
    let appList = PublishSubject<[AppInfo]>()
    
    func transform(_ input: Input) -> Output {
        input.searchButtonTapped
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .withLatestFrom(input.searchText)
            .distinctUntilChanged() // 중복 막아
            .subscribe(onNext: { [weak self] searchTerm in
                
                var searchTerms = UserDefaultsManager.shared.getSearchTerms()
                searchTerms.insert(searchTerm, at: 0)
                UserDefaultsManager.shared.saveSearchTerms(searchTerms)
                
                self?.search(for: searchTerm)
            })
            .disposed(by: disposeBag)
        
        return Output(apps: appList)
    }
    
    func search(for searchTerm: String) {
        
        APIManager.shared.fetchiTunesSearchResults(term: searchTerm)
            .subscribe(onNext: { [weak self] apps in
                self?.appList.onNext(apps)
            })
            .disposed(by: disposeBag)
    }
}

