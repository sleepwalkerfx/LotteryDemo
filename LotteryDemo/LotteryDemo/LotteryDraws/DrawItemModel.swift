//
//  DrawViewModel.swift
//  LotteryDemo
//
//  Created by Rukshan on 23/08/2024.
//
import Foundation

// This ViewModel is used to de-couple business logic models from the presentation layer
struct DrawItemModel: Identifiable {
    
    private let draw: Draw
    private let localizationService: LocalizationServiceProtocol
    
    init(draw: Draw, localizationService: LocalizationServiceProtocol) {
        self.draw = draw
        self.localizationService = localizationService
    }
    
    var id: String {
        String(format: localizationService.localizedString(forKey: .drawId), draw.id)
    }
    
    var numbers: [String] {
        [draw.number1,
         draw.number2,
         draw.number3,
         draw.number4,
         draw.number5,
         draw.number6]
    }
    
    var drawDate: String {
        draw.drawDate
    }
    
    @Localized(key: .dateTitle)
    var dateTitle: String
    
    var bonusBall: String {
        return draw.bonusBall
    }
    
    var topPrizeText: String {
        let currencyCode = Locale.current.currency?.identifier ?? "USD" // Get the device's currency code
        let formattedTopPrize = draw.topPrize.formatted(.currency(code: currencyCode).locale(Locale.current).precision(.fractionLength(0)))
        return String(format: localizationService.localizedString(forKey: .topPrizeFormat), formattedTopPrize)
    }
}

extension DrawItemModel: Hashable {
    static func == (lhs: DrawItemModel, rhs: DrawItemModel) -> Bool {
        lhs.draw.id == rhs.draw.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(draw)
    }
}
