//
//  LotteryDrawDetailsView.swift
//  LotteryDemo
//
//  Created by Rukshan on 25/08/2024.
//

import SwiftUI

struct LotteryDrawDetailsView: View {
    
    @ObservedObject private var viewModel: LotteryDrawDetailsViewModel
    
    init(drawItemModel: DrawItemModel,  swipedRight: @escaping () -> Void, swipedLeft: @escaping () -> Void) {
        self.viewModel = LotteryDrawDetailsViewModel(drawItemModel: drawItemModel,
                                                     swipedRight: swipedRight,
                                                     swipedLeft: swipedLeft)
    }
    
    var body: some View {
        ZStack{
            Color.lotteryDemoClouds
            VStack{
                DrawCardView(title: viewModel.drawItemModel.topPrizeText, numbers: viewModel.drawItemModel.numbers, bonusBall: viewModel.drawItemModel.bonusBall).padding()
                Spacer()
            }
        }.navigationTitle("Numbers")
            .toolbarBackground(Color.lotteryDemoClouds, for: .navigationBar) // Set the navigation bar background color
             .toolbarBackground(.visible, for: .navigationBar)
        .gesture(
            DragGesture()
                .onEnded { value in
                    self.viewModel.gestureEnded(translation: value.translation)
                }
        )
    }
}

#Preview {
    LotteryDrawDetailsView(
        drawItemModel: DrawItemModel(
            draw: Draw(
                id: "1",
                number1: "1",
                number2: "2",
                number3: "3",
                number4: "4",
                number5: "5",
                number6: "6",
                drawDate: "7-7-2024",
                bonusBall: "8",
                topPrize: 10000
            ),
            localizationService: DefaultLocalizationService.shared
        ), 
        swipedRight: {},
        swipedLeft: {})
}
