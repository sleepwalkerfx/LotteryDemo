//
//  LotteryDrawDetailsViewModelTests.swift
//  LotteryDemoTests
//
//  Created by Rukshan on 26/08/2024.
//

import XCTest
@testable import LotteryDemo

class LotteryDrawDetailsViewModelTests: XCTestCase {
    
    // Sample Draw data for testing
    let sampleDraw = Draw(
        id: "1",
        number1: "01",
        number2: "02",
        number3: "03",
        number4: "04",
        number5: "05",
        number6: "06",
        drawDate: "2024-08-26",
        bonusBall: "07",
        topPrize: 1000000
    )
    
    func testGestureEndedWithLeftSwipe() {
        // Given
        let localizationService = MockLocalizationService()
        let drawItemModel = DrawItemModel(draw: sampleDraw, localizationService: localizationService)
        
        var swipedLeftCalled = false
        var swipedRightCalled = false
        
        let viewModel = LotteryDrawDetailsViewModel(
            drawItemModel: drawItemModel,
            swipedRight: { swipedRightCalled = true },
            swipedLeft: { swipedLeftCalled = true }
        )
        
        // When
        let leftSwipeTranslation = CGSize(width: -100, height: 0)
        viewModel.gestureEnded(translation: leftSwipeTranslation)
        
        // Then
        XCTAssertTrue(swipedLeftCalled, "Expected swipedLeft to be called for left swipe")
        XCTAssertFalse(swipedRightCalled, "Expected swipedRight not to be called for left swipe")
    }
    
    func testGestureEndedWithRightSwipe() {
        // Given
        let localizationService = MockLocalizationService()
        let drawItemModel = DrawItemModel(draw: sampleDraw, localizationService: localizationService)
        
        var swipedLeftCalled = false
        var swipedRightCalled = false
        
        let viewModel = LotteryDrawDetailsViewModel(
            drawItemModel: drawItemModel,
            swipedRight: { swipedRightCalled = true },
            swipedLeft: { swipedLeftCalled = true }
        )
        
        // When
        let rightSwipeTranslation = CGSize(width: 100, height: 0)
        viewModel.gestureEnded(translation: rightSwipeTranslation)
        
        // Then
        XCTAssertTrue(swipedRightCalled, "Expected swipedRight to be called for right swipe")
        XCTAssertFalse(swipedLeftCalled, "Expected swipedLeft not to be called for right swipe")
    }
    
    func testGestureEndedWithNoSwipe() {
        // Given
        let localizationService = MockLocalizationService()
        let drawItemModel = DrawItemModel(draw: sampleDraw, localizationService: localizationService)
        
        var swipedLeftCalled = false
        var swipedRightCalled = false
        
        let viewModel = LotteryDrawDetailsViewModel(
            drawItemModel: drawItemModel,
            swipedRight: { swipedRightCalled = true },
            swipedLeft: { swipedLeftCalled = true }
        )
        
        // When
        let noSwipeTranslation = CGSize(width: 10, height: 0)
        viewModel.gestureEnded(translation: noSwipeTranslation)
        
        // Then
        XCTAssertFalse(swipedLeftCalled, "Expected swipedLeft not to be called for small translation")
        XCTAssertFalse(swipedRightCalled, "Expected swipedRight not to be called for small translation")
    }
}
