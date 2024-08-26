//
//  LocalizationService.swift
//  LotteryDemo
//
//  Created by Rukshan on 24/08/2024.
//

import Foundation

protocol LocalizationServiceProtocol {
    func localizedString(forKey key: LocalizableKeys) -> String
}

class DefaultLocalizationService: LocalizationServiceProtocol {
    
    static let shared = DefaultLocalizationService()
    private init() {}
    
    func localizedString(forKey key: LocalizableKeys) -> String {
        //This uses Localizable string catalog
        return NSLocalizedString(key.rawValue, comment: "")
    }
}
