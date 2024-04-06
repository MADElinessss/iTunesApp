//
//  DateFormatterManager.swift
//  iTunesApp
//
//  Created by Madeline on 4/7/24.
//

import Foundation

class DateFormatterManager {
    static let shared = DateFormatterManager()

    private init() {}

    private lazy var roundedDecimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.roundingMode = .halfUp
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        return formatter
    }()
    
    func string(from number: Double) -> String {
        return roundedDecimalFormatter.string(from: NSNumber(value: number)) ?? ""
    }
}
