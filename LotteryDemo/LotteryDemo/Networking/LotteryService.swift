//
//  APIClient.swift
//  LotteryDemo
//
//  Created by Rukshan on 20/08/2024.
//

import Foundation


protocol LotteryServiceProtocol: APIServiceProtocol {
    func getDraws() async throws -> [Draw]
}

class LotteryService: LotteryServiceProtocol {
    
    static let shared = LotteryService()
    private init() {}
    
    func getDraws() async throws -> [Draw] {
        try? await Task.sleep(nanoseconds: 2_000_000_000) // simulate network call to see the loader
        let decoder = JSONDecoderFactory.createDefaultDecoder()
        let drawsResonse: Draw.APIResponse = try decodeData(with: MockJSON.jsonData, decoder: decoder)
        return drawsResonse.draws
    }
}
