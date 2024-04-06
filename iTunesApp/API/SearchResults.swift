//
//  SearchResult.swift
//  iTunesApp
//
//  Created by Madeline on 4/7/24.
//

import Foundation

struct SearchResults: Decodable {
    let results: [AppInfo]
}

struct AppInfo: Decodable {
    let trackName: String // 앱 이름
    let artworkUrl100: String // 로고 이미지 (100x100)
    let screenshotUrls: [String] // 스크린샷 URLs
    let artistName: String // 회사(개발자) 이름
    let version: String // 버전
    let releaseNotes: String? // 버전 정보 설명
    let description: String // 앱 설명
    let formattedPrice: String? // 앱 가격
    let averageUserRating: Double? // 평점
    let genres: [String] // 장르
}

