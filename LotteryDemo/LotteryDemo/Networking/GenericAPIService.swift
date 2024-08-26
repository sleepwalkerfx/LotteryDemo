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
    
    // MARK:  this  function would be something like below if there was a real network to call to make
    
//    func fetch<T: Decodable>(url: URL) async throws -> T {
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
//            throw URLError(.badServerResponse)
//        }
//        let decoder = JSONDecoderFactory.createDefaultDecoder()
//        let object = try decoder.decode(T.self, from: data)
//        return object
//    }
}
