//
//  DependencyManager.swift
//  LotteryDemo
//
//  Created by Rukshan on 23/08/2024.
//

import Foundation

struct DependencyProvider {
    static var lotteryService: LotteryServiceProtocol {
        return LotteryService.shared
    }
    
    static var defaultLocalizationService: LocalizationServiceProtocol {
        return DefaultLocalizationService.shared
    }
    
    @MainActor static var drawListViewModel: DrawListViewModel {
        return DrawListViewModel(
            lotteryDrawService: lotteryService,
            localizationService: defaultLocalizationService
        )
    }
}
