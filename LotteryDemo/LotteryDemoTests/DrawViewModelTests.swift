//
//  DrawViewModelTests.swift
//  LotteryDemoTests
//
//  Created by Rukshan on 23/08/2024.
//

import XCTest
@testable import LotteryDemo

final class DrawViewModelTests: XCTestCase {
    
    func testDrawViewModelInitialization() {
        // Given: A sample Draw object
        let sampleDraw = Draw(
            id: "1",
            number1: "10",
            number2: "20",
            number3: "30",
            number4: "40",
            number5: "50",
            number6: "60",
            drawDate: "2023-05-15",
            bonusBall: "15",
            topPrize: 1000000
        )
        
        // When: A DrawViewModel is created
        let viewModel = DrawItemModel(draw: sampleDraw, localizationService: DefaultLocalizationService.shared)
        
        // Then: The ViewModel properties should match the Draw object
        XCTAssertEqual(viewModel.id, "Draw ID: 1", "The id should be formatted correctly")
        XCTAssertEqual(viewModel.numbers, ["10", "20", "30", "40", "50", "60"], "The numbers should be returned as an array of strings")
        XCTAssertEqual(viewModel.drawDate, "2023-05-15", "The drawDate should be '2023-05-15'")
        XCTAssertEqual(viewModel.bonusBall, "15", "The bonusBall text should be formatted in String")
        XCTAssertEqual(viewModel.topPrizeText, "Top Prize: £1,000,000", "The topPrizeText should be formatted correctly")
    }
    
}
