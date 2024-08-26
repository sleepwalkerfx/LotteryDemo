//
//  RemoteLocalizationService.swift
//  LotteryDemo
//
//  Created by Rukshan on 24/08/2024.
//

import Foundation

// This class is not used in this app, but this is just to demonstrate why LocalizationService protocol was needed in the first place
// and how we can extend it further.

class RemoteLocalizationService: LocalizationServiceProtocol {
    private var localizationDict: [String: String] = [:]

    init(url: URL) async {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: String] {
                localizationDict = json
            }
        } catch {
            print("Failed to fetch localization: \(error)")
        }
    }

    func localizedString(forKey key: LocalizableKeys) -> String {
        return localizationDict[key.rawValue] ?? key.rawValue
    }
}
