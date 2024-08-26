//
//  APIService.swift
//  LotteryDemo
//
//  Created by Rukshan on 23/08/2024.
//

import Foundation

protocol APIServiceProtocol {
    func decodeData<T: Decodable>(with data: Data, decoder: JSONDecoder) throws -> T
}

extension APIServiceProtocol {
    // Generic helper
    func decodeData<T: Decodable>(with data: Data, decoder: JSONDecoder) throws -> T {
        let drawsResponse = try decoder.decode(T.self, from: data)
        return drawsResponse
    }
}
