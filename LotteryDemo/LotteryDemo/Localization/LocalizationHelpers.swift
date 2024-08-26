//
//  LocalizationHelpers.swift
//  LotteryDemo
//
//  Created by Rukshan on 24/08/2024.
//

import Foundation

@propertyWrapper struct Localized {
    private let key: LocalizableKeys
    private let localizationService: LocalizationServiceProtocol

    // The actual value of the property
    var wrappedValue: String {
        localizationService.localizedString(forKey: key)
    }

    init(
        key: LocalizableKeys,
        localizationService: LocalizationServiceProtocol = DefaultLocalizationService.shared
    ) {
        self.key = key
        self.localizationService = localizationService
    }
}
