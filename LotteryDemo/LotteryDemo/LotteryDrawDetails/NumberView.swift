//
//  NumbersView.swift
//  LotteryDemo
//
//  Created by Rukshan on 26/08/2024.
//

import SwiftUI

struct NumberView: View {
    var number: String
    var color: Color = .lotteryDemoWisteria
    var body: some View {
        ZStack {
            Circle().fill(color).frame(width: 40, height: 40)
            Text(number)
                .bold()
                .font(.title2)
                .foregroundStyle(.lotteryDemoClouds)
        }
        
    }
}

#Preview {
    NumberView(number: "01")
}

