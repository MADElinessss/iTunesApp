//
//  UserDefaultsManager.swift
//  iTunesApp
//
//  Created by Madeline on 4/8/24.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init() { }
    
    func saveSearchTerms(_ terms: [String]) {
        UserDefaults.standard.set(terms, forKey: "recentSearches")
    }
    
    func getSearchTerms() -> [String] {
        return UserDefaults.standard.stringArray(forKey: "recentSearches") ?? []
    }
}
