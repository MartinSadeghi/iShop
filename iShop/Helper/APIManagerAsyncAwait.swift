//
//  APIManagerAsyncAwait.swift
//  iShop
//
//  Created by Mommo Sadeghi on 11/07/23.
//


import Foundation

enum AsyncAwaitDataError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case network(_ error: Error?)
}

// Singleton design pattern
final class APIManagerAsyncAwait {
    static let shared = APIManagerAsyncAwait()
    private init() {}
    
    func request<T: Codable>(modelType: T.Type, type: EndPointType) async throws -> T {
        guard let url = type.url else {
            throw AsyncAwaitDataError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~= httpResponse.statusCode else {
            throw AsyncAwaitDataError.invalidResponse
        }
        
        do {
            let products = try JSONDecoder().decode(modelType, from: data)
            return products
        } catch {
            throw AsyncAwaitDataError.network(error)
        }
    }
}
