//
//  DetailEndPoint.swift
//  iShop
//
//  Created by Mommo Sadeghi on 12/07/23.
//

import Foundation



enum DetailEndPoint {
    case product(name: String)
}


extension DetailEndPoint: EndPointType {
    
    
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
