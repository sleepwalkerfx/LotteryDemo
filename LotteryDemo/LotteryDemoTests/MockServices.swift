//
//  MockServices.swift
//  LotteryDemoTests
//
//  Created by Rukshan on 26/08/2024.
//

import XCTest
@testable import LotteryDemo

// Mock LocalizationService for testing purposes

final class MockLocalizationService: LocalizationServiceProtocol {
    func localizedString(forKey key: LocalizableKeys) -> String {
        return key.rawValue
    }
}


final class MockLotteryService: LotteryServiceProtocol {
    var shouldThrowError = false
    var mockDraws: [Draw] = []
    
    func getDraws() throws -> [Draw] {
        if shouldThrowError {
            throw NSError(domain: "MockErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Mock error"])
        }
        return mockDraws
    }
}
