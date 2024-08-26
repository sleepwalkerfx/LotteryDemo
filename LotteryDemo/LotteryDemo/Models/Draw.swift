//
//  Draw.swift
//  LotteryDemo
//
//  Created by Rukshan on 23/08/2024.
//
import Foundation

// MARK: - Draw
struct Draw: Codable, Identifiable, Hashable {
    let id: String
    let number1: String
    let number2: String
    let number3: String
    let number4: String
    let number5: String
    let number6: String
    let drawDate: String
    let bonusBall: String
    let topPrize: Int64

    enum CodingKeys: String, CodingKey {
        case id
        case number1
        case number2
        case number3
        case number4
        case number5
        case number6
        case drawDate
        case bonusBall = "bonus-ball"
        case topPrize
    }
}

// MARK: - APIResponse
extension Draw {
    struct APIResponse: Codable {
        let draws: [Draw]
    }
}
