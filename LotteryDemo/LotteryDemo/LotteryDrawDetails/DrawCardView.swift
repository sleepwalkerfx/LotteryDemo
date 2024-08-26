//
//  DrawCardView.swift
//  LotteryDemo
//
//  Created by Rukshan on 26/08/2024.
//

import SwiftUI

struct DrawCardView: View {
    var title: String
    var numbers: [String]
    var bonusBall: String
    var body: some View {
        VStack {
            Text(title).font(.title).foregroundStyle(.gray).bold()
            HStack {
                ForEach(numbers, id: \.self) { number in
                    NumberView(number: number).frame(width: 50, height: 50)
                }
                NumberView(number: bonusBall, color: .lotteryDemoRed)
            }
            
        }
    }
}


#Preview {
    DrawCardView(title: "Winning Numbers", numbers: ["01", "09", "03","21", "32", "35"], bonusBall: "77")
}
