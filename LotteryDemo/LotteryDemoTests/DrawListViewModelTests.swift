//
//  DrawListViewModelTests.swift
//  LotteryDemoTests
//
//  Created by Rukshan on 25/08/2024.
//

import XCTest
@testable import LotteryDemo

final class DrawListViewModelTests: XCTestCase {
    
    var viewModel: DrawListViewModel!
    var mockLotteryService: MockLotteryService!
    var mockLocalizationService: MockLocalizationService!
    
    @MainActor override func setUpWithError() throws {
        try super.setUpWithError()
        mockLotteryService = MockLotteryService()
        mockLocalizationService = MockLocalizationService()
        viewModel = DrawListViewModel(lotteryDrawService: mockLotteryService, localizationService: mockLocalizationService)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockLotteryService = nil
        mockLocalizationService = nil
        super.tearDown()
    }
    
    func testFetchDraws_Successful() async {
        //given: mock objects
        let mockDraw = Draw(id: "1", number1: "0", number2: "1", number3: "2", number4: "3", number5: "4", number6: "5", drawDate: "09-11-2024", bonusBall: "11", topPrize: 10000)
        mockLotteryService.mockDraws = [mockDraw]
        
        //when: fetch is called
        await viewModel.fetchDraws()
        
        // then
        await MainActor.run {
            XCTAssertFalse(viewModel.isLoading)
            XCTAssertNil(viewModel.errorMessage)
            XCTAssertEqual(viewModel.draws.count, 1)
            XCTAssertEqual(viewModel.draws.first!.id, "1")
        }
    }
    
    func testFetchDraws_Error() async {
        // given: error state
        mockLotteryService.shouldThrowError = true
        
        //when: fetch is called
        await viewModel.fetchDraws()
        
        //then
        await MainActor.run {
            XCTAssertFalse(viewModel.isLoading)
            XCTAssertNotNil(viewModel.errorMessage)
            XCTAssertEqual(viewModel.draws.count, 0)
            XCTAssertEqual(viewModel.errorMessage, "Mock error")
        }
    }
    
    func testDrawListTitle_Localization() async {
        // given : expected title from Localizable strings catalog
        let expectedTitle = "Lottery Draws"
        //when
        let title = await viewModel.drawListTitle
        
        //then
        XCTAssertEqual(title, expectedTitle)
    }
    
    func testDrawListLoadingTitle_Localization() async {
        // given : expected title from Localizable strings catalog
        let expectedTitle = "Loading..."
        //when
        let title = await viewModel.loadingTitle
        
        //then
        XCTAssertEqual(title, expectedTitle)
    }
}
