//
//  APIManager.swift
//  iShop
//
//  Created by Mommo Sadeghi on 29/06/23.
//

import Foundation


enum DataError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case network(_ error: Error?)
}

// typealias Handler = (Result<[Product], DataError >) -> Void

typealias Handler<T> = (Result<T, DataError>) -> Void



// Singleton design pattern
final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    
    func request<T: Codable> (
        modelType: T.Type,
        type: EndPointType,
        completion: @escaping Handler<T>
    ) {
        guard let url = type.url else { return }
        
//        var request = URLRequest(url: url)
//        request.httpMethod = type.method.rawValue
//        if let parameters = type.body {
//            request.httpBody = try? JSONEncoder().encode(parameters)
//        }
        
//        request.allHTTPHeaderFields = type.headers
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  200...299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            do {
                let products = try JSONDecoder().decode(modelType, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.network(error)))
            }
        }.resume()
        
    }
    
}
