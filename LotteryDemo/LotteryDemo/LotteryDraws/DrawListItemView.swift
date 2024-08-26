//
//  DrawListItemView.swift
//  LotteryDemo
//
//  Created by Rukshan on 26/08/2024.
//

import SwiftUI

struct DrawListItemView: View {
    var model: DrawItemModel
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10){
            HStack {
                Image(systemName: "calendar.circle")
                    .foregroundStyle(.lotteryDemoBlack)
                Text(model.id)
                    .font(.headline)
                .foregroundStyle(.lotteryDemoBlack)
            }
            Text(model.drawDate)
                .font(.title).bold()
                .foregroundStyle(.lotteryDemoWisteria)
        }
        
    }
}

#Preview {
    DrawListItemView(model: DrawItemModel(draw: Draw(id: "1", number1: "01", number2: "02", number3: "03", number4: "04", number5: "05", number6: "06", drawDate: "07-07-2024", bonusBall: "23", topPrize: 1000000000), localizationService: DefaultLocalizationService.shared))
}
