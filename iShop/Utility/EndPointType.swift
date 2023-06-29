//
//  EndPointType.swift
//  iShop
//
//  Created by Mommo Sadeghi on 29/06/23.
//

import Foundation


enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
   
}

