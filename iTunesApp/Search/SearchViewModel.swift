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
    
    enum SearchState {
        case initial
        case searched
    }
    
    var searchState: BehaviorSubject<SearchState> = BehaviorSubject(value: .initial)
    
    func updateSearchState(_ state: SearchState) {
        searchState.onNext(state)
    }
    
    struct Input {
        let searchButtonTapped: ControlEvent<Void>
        let searchText: ControlProperty<String>
    }
    
    struct Output {
        let apps: PublishSubject<[AppInfo]>
        let searchTerms: PublishSubject<[String]>
    }
    
    let appList = PublishSubject<[AppInfo]>()
    let searchTermList = PublishSubject<[String]>()
    
//    func transform(_ input: Input) -> Output {
//        input.searchButtonTapped
//            .throttle(.seconds(1), scheduler: MainScheduler.instance)
//            .withLatestFrom(input.searchText)
//            .distinctUntilChanged() // 중복 막아
//            .subscribe(onNext: { [weak self] searchTerm in
//                self?.searchState.onNext(.searched)
//                self?.search(for: searchTerm)
//            })
//            .disposed(by: disposeBag)
//
//        return Output(apps: appList, searchTerms: searchTermList)
//    }
    
    func transform(_ input: Input) -> Output {
        let searchButtonTrigger = input.searchButtonTapped
            .withLatestFrom(input.searchText)
        
        searchButtonTrigger
            .subscribe(onNext: { [weak self] searchTerm in
                self?.searchState.onNext(.searched)
                self?.search(for: searchTerm)
            })
            .disposed(by: disposeBag)
        
        return Output(apps: appList, searchTerms: searchTermList)
    }

    
    func search(for searchTerm: String) {
        
//        APIManager.shared.fetchSingleiTunesSearchResults(term: searchTerm)
//            .subscribe(onNext: { [weak self] apps in
//                self?.appList.onNext(apps)
//            })
//            .disposed(by: disposeBag)
        
        APIManager.shared.fetchSingleiTunesSearchResults(term: searchTerm)
            .catch { error in
                print("API 호출 중 오류 발생: \(error)")
                return Single<[AppInfo]>.never()
            }
            .subscribe(with: self) { owner, apps in
                owner.appList.onNext(apps)
            }
            .disposed(by: disposeBag)
    }
}

