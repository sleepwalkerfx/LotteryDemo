//
//  DrawListViewModel.swift
//  LotteryDemo
//
//  Created by Rukshan on 23/08/2024.
//

import Foundation

@MainActor
class DrawListViewModel: ObservableObject {
    @Published var draws: [DrawItemModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var navigationPath: [DrawItemModel] = [] // navigation state for NavigationStack
    
    private let lotteryDrawService: LotteryServiceProtocol
    private let localizationService: LocalizationServiceProtocol
    
    init(lotteryDrawService: LotteryServiceProtocol, localizationService: LocalizationServiceProtocol) {
        self.lotteryDrawService = lotteryDrawService
        self.localizationService = localizationService
    }
    
    func fetchDraws() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let drawModels = try await self.lotteryDrawService.getDraws()
            self.draws = drawModels.map { DrawItemModel(draw: $0, localizationService: localizationService)}
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    func navigateToNextItem(currentItem: DrawItemModel) {
        if let nextDraw = draws.element(after: currentItem) {
            navigationPath = [nextDraw]
        }
    }
    
    func navigateToPrevious(currentItem: DrawItemModel) {
        if let prevDraw = draws.element(before: currentItem) {
            navigationPath = [prevDraw]
        }
    }
    
    @Localized(key: .lotteryDraws)
    var drawListTitle: String
    
    @Localized(key: .loading)
    var loadingTitle: String
    
    // MARK:  Property wrapper Explaination
    
    // With the property wrapper following implementation was simplified
    //    var drawListTitle: String {
    //        localizationService.localizedString(forKey: .lotteryDraws)
    //    }
    
}

