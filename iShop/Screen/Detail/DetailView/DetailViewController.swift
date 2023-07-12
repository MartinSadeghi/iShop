//
//  DetailViewController.swift
//  iShop
//
//  Created by Mommo Sadeghi on 12/07/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    // MARK:  - Variables

    var selectedProduct: ProductDetail?

    
    
    // MARK:  - Initialization

    init(product: ProductDetail) {
        super.init(nibName: nil, bundle: nil)
        self.selectedProduct = product
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK:  - Application Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }



}
