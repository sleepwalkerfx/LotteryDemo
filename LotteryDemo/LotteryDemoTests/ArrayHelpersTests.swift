//
//  ArrayHelpersTests.swift
//  LotteryDemoTests
//
//  Created by Rukshan on 26/08/2024.
//

import XCTest

@testable import LotteryDemo

class ArrayExtensionTests: XCTestCase {
    
    // Test case for element(after:)
    func testElementAfter() {
        let array = [1, 2, 3, 4, 5]
        
        XCTAssertEqual(array.element(after: 2), 3, "Expected 3 to be after 2")
        XCTAssertEqual(array.element(after: 4), 5, "Expected 5 to be after 4")
        XCTAssertNil(array.element(after: 5), "Expected nil after the last element")
        XCTAssertNil(array.element(after: 0), "Expected nil for an element not in the array")
    }
    
    // Test case for element(before:)
    func testElementBefore() {
        let array = [1, 2, 3, 4, 5]
        
        XCTAssertEqual(array.element(before: 3), 2, "Expected 2 to be before 3")
        XCTAssertEqual(array.element(before: 1), nil, "Expected nil before the first element")
        XCTAssertEqual(array.element(before: 5), 4, "Expected 4 to be before 5")
        XCTAssertNil(array.element(before: 0), "Expected nil for an element not in the array")
    }
    
    // Test case for element(after:) and element(before:) with an empty array
    func testElementAfterAndBeforeInEmptyArray() {
        let emptyArray: [Int] = []
        
        XCTAssertNil(emptyArray.element(after: 1), "Expected nil in an empty array")
        XCTAssertNil(emptyArray.element(before: 1), "Expected nil in an empty array")
    }
    
    // Test case for element(after:) and element(before:) when array contains only one element
    func testElementAfterAndBeforeInSingleElementArray() {
        let singleElementArray = [1]
        
        XCTAssertNil(singleElementArray.element(after: 1), "Expected nil when there's only one element")
        XCTAssertNil(singleElementArray.element(before: 1), "Expected nil when there's only one element")
    }
    
    // Test case for element(after:) and element(before:) with multiple occurrences of the same element
    func testElementAfterAndBeforeWithDuplicates() {
        let arrayWithDuplicates = [1, 2, 2, 3, 4]
        
        XCTAssertEqual(arrayWithDuplicates.element(after: 2), 2, "Expected 2 to be after the first occurrence of 2")
        XCTAssertEqual(arrayWithDuplicates.element(before: 2), 1, "Expected 1 to be before the first occurrence of 2")
    }
}

