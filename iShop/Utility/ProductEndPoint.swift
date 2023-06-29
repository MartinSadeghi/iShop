//
//  ProductEndPoint.swift
//  iShop
//
//  Created by Mommo Sadeghi on 29/06/23.
//

import Foundation




// "https://dummyjson.com/products"

enum ProductEndPoint {
    case product // Module - GET
}

extension ProductEndPoint: EndPointType {
    
    
    var path: String {
        switch self {
        case .product:
            return "products"
        }
    }
    
    
    var baseURL: String {
        switch self {
        case .product:
            return "https://dummyjson.com/"
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
