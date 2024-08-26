//
//  ArrayHelpers.swift
//  LotteryDemo
//
//  Created by Rukshan on 25/08/2024.
//

import Foundation

extension Array where Element: Equatable {
    func element(after element: Element) -> Element? {
        if let currentIndex = self.firstIndex(of: element) {
            let nextIndex = currentIndex + 1
            return nextIndex < self.count ? self[nextIndex] : nil
        }
        return nil
    }

    func element(before element: Element) -> Element? {
        if let currentIndex = self.firstIndex(of: element) {
            let prevIndex = currentIndex - 1
            return prevIndex >= 0 ? self[prevIndex] : nil
        }
        return nil
    }
}
