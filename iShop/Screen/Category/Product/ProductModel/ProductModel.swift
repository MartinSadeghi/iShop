//
//  Model.swift
//  iShop
//
//  Created by Mommo Sadeghi on 29/06/23.
//

import Foundation


// "https://dummyjson.com/products/category/smartphones"


struct ProductModel : Codable {
    let products    : [Product]
    let total       : Int
    let skip        : Int
    let limit       : Int
}

struct Product: Codable {
    let id                 : Int
    let title              : String
    let description        : String
    let price              : Int
    let discountPercentage : Double
    let rating             : Double
    let stock              : Int
    let brand              : String
    let category           : String
    let thumbnail          : String
    let images             : [String]
}

