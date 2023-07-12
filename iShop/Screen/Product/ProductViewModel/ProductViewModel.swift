//
//  ProductViewModel.swift
//  iShop
//
//  Created by Mommo Sadeghi on 29/06/23.
//

import Foundation

final class ProductViewModel {
    
    var productList: ProductList?
    var selectedCategory: Product?
    
    
    
    // MARK:  - typealiasd
    var eventHandler: ((_ event: Event) -> Void)?
    
    
    
    // MARK:  - Methods
    
    func fetchProducts() {
        eventHandler?(.loading)
        APIManager.shared.request(modelType: ProductList.self, type: ProductEndPoint.product(name: selectedCategory?.category ?? "")) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let products):
                self.eventHandler?(.dataLoaded)
                self.productList = products
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
            
        }
    }
    
    
    
    
}

    
    
        // MARK:  - Extension
    
    extension ProductViewModel {
        
        enum Event {
            case loading
            case stopLoading
            case dataLoaded
            case error(Error?)
        }
    }
    
    
