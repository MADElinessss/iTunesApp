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
    
    static func fetchiTunesSearchResults(term: String, completionHandler: @escaping (Result<[AppInfo], Error>) -> Void) {
        let url = "https://itunes.apple.com/search?term=\(term)&entity=software&limit=20"
        AF.request(url, method: .get).responseDecodable(of: SearchResults.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(.success(success.results))
            case .failure(let error):
                print(error)
            }
        }
    }
}
