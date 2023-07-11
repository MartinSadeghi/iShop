//
//  ProductEndPoint.swift
//  iShop
//
//  Created by Mommo Sadeghi on 29/06/23.
//

import Foundation




// "https://dummyjson.com/products"

enum ProductEndPoint {
    case product(name: String) // Module - GET
}

extension ProductEndPoint: EndPointType {
    
    
    var path: String {
        switch self {
        case .product(let name):
            return "\(name)"
        }
    }

    
    var baseURL: String {
        switch self {
        case .product:
            return "https://dummyjson.com/products/category/"
        }
    }
    
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        switch self {
        case .product:
            return .get
        }
    }
    
}
