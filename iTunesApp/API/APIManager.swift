//
//  APIManager.swift
//  iTunesApp
//
//  Created by Madeline on 4/6/24.
//

import Alamofire
import Foundation
import RxSwift

class APIManager {
    
    static let shared = APIManager()
    
    func fetchiTunesSearchResults(term: String) -> Observable<[AppInfo]> {
        return Observable<[AppInfo]>.create { observer in
            let url = "https://itunes.apple.com/search?term=\(term)&entity=software&limit=20&lang=ko-kr&country=kr"
            AF.request(url, method: .get).responseDecodable(of: SearchResults.self) { response in
                switch response.result {
                case .success(let success):
                    observer.onNext(success.results)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
        
    }
}
