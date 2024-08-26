//
//  LotteryDrawDetailsViewModel.swift
//  LotteryDemo
//
//  Created by Rukshan on 25/08/2024.
//

import Foundation

class LotteryDrawDetailsViewModel: ObservableObject {
    
    var drawItemModel: DrawItemModel
    var swipedRight: () -> Void
    var swipedLeft: () -> Void
    
    init(drawItemModel: DrawItemModel, swipedRight: @escaping () -> Void, swipedLeft: @escaping () -> Void) {
        self.swipedRight = swipedRight
        self.swipedLeft = swipedLeft
        self.drawItemModel = drawItemModel
    }

    func gestureEnded(translation: CGSize) {
        // Determine swipe direction
        if translation.width < -50 {
            // Left swipe detected
            swipedLeft()
        } else if translation.width > 50 {
            // Right swipe detected
            swipedRight()
        }
    }
}
