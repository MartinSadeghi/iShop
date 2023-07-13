//
//  DetailViewController.swift
//  iShop
//
//  Created by Mommo Sadeghi on 12/07/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    // MARK:  - Variables

    var selectedProductID: ProductDetails?
    
    var selectedProduct: ProductDetails? {
        didSet {
            configureProductDetails()
        }
    }
    
    

    // MARK:  - Outlets

    
    @IBOutlet weak var detailStackView: UIStackView!
    @IBOutlet weak var idLable: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var rankingLable: UILabel!
    @IBOutlet weak var stockLable: UILabel!
    @IBOutlet weak var brandLable: UILabel!
    @IBOutlet weak var categoryLable: UILabel!
    
    
    
    
    // MARK:  - Initialization

    init(product: ProductDetails) {
        super.init(nibName: nil, bundle: nil)
        self.selectedProduct = product
        print(selectedProduct?.id)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK:  - Application Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
                 await fetchProductDetails()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
//    func fetchProductDetails2() async {
//        await APIManagerAsyncAwait.shared.request(modelType: ProductDetail.self, type: DetailEndPoint.product(name: selectedProduct?.category ?? "")) { response in
//            switch response {
//            case .success(let productDetails):
//                print(productDetails)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    func fetchProductDetails() async {
        do {
            let productDetails = try await APIManagerAsyncAwait.shared.request(modelType: ProductDetail.self, type: DetailEndPoint.product(name: selectedProduct?.category ?? ""))
            productDetails.products
            print(productDetails)
        } catch {
            print(error)
        }
    }
    
//    func fetchProductDetails() async {
//        do {
//            let productDetails = try await APIManagerAsyncAwait.shared.request(modelType: ProductDetail.self, type: DetailEndPoint.product(name: selectedProduct?.category ?? ""))
//            print(productDetails)
//        } catch {
//            print(error)
//        }
    
    
    
    
    func configureProductDetails() {
        guard let selectedProduct else { return }
        idLable.text = String(selectedProduct.id)
        titleLable.text = selectedProduct.title
        descriptionLable.text = selectedProduct.description
        priceLable.text = String(selectedProduct.price)
        rankingLable.text = String(selectedProduct.rating)
        stockLable.text = String(selectedProduct.stock)
        brandLable.text = selectedProduct.brand
        categoryLable.text = selectedProduct.category
    }


}
