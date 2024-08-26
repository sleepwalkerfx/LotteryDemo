//
//  JSONDecoderFactory.swift
//  LotteryDemo
//
//  Created by Rukshan on 20/08/2024.
//

import Foundation

// Simple Factory desgin pattern for creating JSONDecoder instances
struct JSONDecoderFactory {
    static func createDefaultDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
    
    static func createSnakeCaseDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
