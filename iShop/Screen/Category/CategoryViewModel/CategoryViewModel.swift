//
//  CategoryViewModel.swift
//  iShop
//
//  Created by Mommo Sadeghi on 29/06/23.
//

import Foundation


final class CategoryViewModel {
    
    // MARK:  - Variables
    
       var categories = CategoryModel()


    
    // MARK:  - typealias
    var eventHandler: ((_ event: Event) -> Void)?
    
    
    
    
    // MARK:  - Methods
    
    func fetchCategory() {
        self.eventHandler?(.loading)
        APIManager.shared.request(
            modelType: CategoryModel.self,
            type: CategoryEndPoint.category) { response in
                self.eventHandler?(.stopLoading)
                switch response {
                case .success(let categories):
                    self.categories = categories
//                    print(categories)
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
                }
            }
    }
}


    // MARK:  - Extension
extension CategoryViewModel {
    
    
    // MARK:  - Enums
    
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}






    

