//
//  LotteryServiceTests.swift
//  LotteryDemoTests
//
//  Created by Rukshan on 26/08/2024.
//

import XCTest
@testable import LotteryDemo

//Tests for LotteryService concrete class
class LotteryServiceTests: XCTestCase {
    
    //Testing valid JSON decoding
    func testGetDrawsWithValidJSON() {
        // given
        let expectedDraws = [
            Draw(id: "1", number1: "10", number2: "20", number3: "30", number4: "40", number5: "50", number6: "60", drawDate: "2024-08-26", bonusBall: "5", topPrize: 1000000),
            Draw(id: "2", number1: "11", number2: "21", number3: "31", number4: "41", number5: "51", number6: "61", drawDate: "2024-08-27", bonusBall: "6", topPrize: 2000000)
        ]
        let validJSON = """
        {
            "draws": [
                {
                    "id": "1",
                    "number1": "10",
                    "number2": "20",
                    "number3": "30",
                    "number4": "40",
                    "number5": "50",
                    "number6": "60",
                    "drawDate": "2024-08-26",
                    "bonus-ball": "5",
                    "topPrize": 1000000
                },
                {
                    "id": "2",
                    "number1": "11",
                    "number2": "21",
                    "number3": "31",
                    "number4": "41",
                    "number5": "51",
                    "number6": "61",
                    "drawDate": "2024-08-27",
                    "bonus-ball": "6",
                    "topPrize": 2000000
                }
            ]
        }
        """.data(using: .utf8)!
        
        // Inject the mock JSON data
        MockJSON.jsonData = validJSON
        
        let lotteryService = LotteryService.shared
        
        // when
        do {
            let draws = try lotteryService.getDraws()
            
            // Then
            XCTAssertEqual(draws, expectedDraws, "Expected draws to match the decoded JSON data")
        } catch {
            XCTFail("Expected no error, but got \(error)")
        }
    }
    
    // Test invalid JSON decoding
    func testGetDrawsWithInvalidJSON() {
        // Given
        let invalidJSON = """
        {
            "invalid_key": [
                {
                    "id": "1",
                    "number1": "10",
                    "number2": "20",
                    "number3": "30",
                    "number4": "40",
                    "number5": "50",
                    "number6": "60",
                    "drawDate": "2024-08-26",
                    "bonus-ball": "5",
                    "topPrize": 1000000
                }
            ]
        }
        """.data(using: .utf8)!
        
        //inject the mock JSON data
        MockJSON.jsonData = invalidJSON
        let lotteryService = LotteryService.shared
        
        //whn
        XCTAssertThrowsError(try lotteryService.getDraws(), "Expected decoding to throw an error for invalid JSON") { error in
            // then
            XCTAssertTrue(error is DecodingError, "Expected a DecodingError, but got \(error)")
        }
    }
    
    // Test empty JSON
    func testGetDrawsWithEmptyJSON() {
        //givn
        let emptyJSON = """
        {
            "draws": []
        }
        """.data(using: .utf8)!
        
        // Inject the mock JSON data
        MockJSON.jsonData = emptyJSON
        
        let lotteryService = LotteryService.shared
        
        //when
        do {
            let draws = try lotteryService.getDraws()
            
            // then
            XCTAssertTrue(draws.isEmpty, "Expected draws to be empty for empty JSON response")
        } catch {
            XCTFail("Expected no error, but got \(error)")
        }
    }
}
