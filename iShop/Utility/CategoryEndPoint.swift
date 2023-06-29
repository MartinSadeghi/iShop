//
//  CategoryEndPoint.swift
//  iShop
//
//  Created by Mommo Sadeghi on 29/06/23.
//

import Foundation




//  "https://dummyjson.com/products/categories"


enum CategoryEndPoint {
    case category // Module - GET
}

extension CategoryEndPoint: EndPointType {
    
    
    var path: String {
        switch self {
        case .category:
            return "categories"
        }
    }
    
    
    var baseURL: String {
        switch self {
        case .category:
            return "https://dummyjson.com/products/"
        }
    }
    
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        switch self {
        case .category:
            return .get
        }
    }
    
    
}
