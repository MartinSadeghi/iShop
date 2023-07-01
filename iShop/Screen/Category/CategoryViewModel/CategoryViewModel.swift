//
//  CategoryViewModel.swift
//  iShop
//
//  Created by Mommo Sadeghi on 29/06/23.
//

import Foundation


class CategoryViewModel {
    
    private var categories: [CategoryModel] = []
    
    func fetchCategories() {
        // Simulated data fetch
        categories = [
            CategoryModel(title: "Kylo", image: nil),
            CategoryModel(title: "Cooper", image: nil)
        ]
    }
    
    func numberOfCategories() -> Int {
        return categories.count
    }
    
    func category(at index: Int) -> CategoryModel {
        return categories[index]
    }
}
