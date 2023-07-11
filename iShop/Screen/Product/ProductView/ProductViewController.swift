//
//  ProductViewController.swift
//  iShop
//
//  Created by Mommo Sadeghi on 29/06/23.
//

import UIKit

class ProductViewController: UIViewController {
    
    
    // MARK:  - Variables
    
    var productList : ProductList?
    var selectedCategory: Product?
    
    
    // MARK:  - Initialization
    
    init(product: Product) {
        super.init(nibName: nil, bundle: nil)
        self.selectedCategory = product
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK:  - Application Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "ProductVCBackground")
        configureTableView()
        fetchProduct()
//        guard let selectedCategory else { return }
//        print(selectedCategory)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        navigationItem.title = selectedCategory?.category
        }
    
    
    func fetchProduct() {
        APIManager.shared.request(modelType: ProductList.self, type: ProductEndPoint.product(name: selectedCategory?.category ?? "")) { response in
            switch response {
            case.success(let product):
                DispatchQueue.main.async {
                    self.productList = product
                    self.productTableView.reloadData()
                }
//                print(product)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    
    
    // MARK:  -    UI Outlets
    
    /// Creating ProductTableViewl
    private lazy var productTableView : UITableView = {
        let table             = UITableView()
        table.register(ProductCell.self, forCellReuseIdentifier: Constants.productCellIdentifier)
//        table.backgroundColor = UIColor(named: "CategoryVCBackgroundColor")
        return table
    }()
    
}

// MARK:  - ProductTableView required protocols

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productList?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.productCellIdentifier, for: indexPath) as? ProductCell else { return UITableViewCell() }
        if let productCell = productList?.products[indexPath.row] {
//            print(productCell)
            cell.productItem = productCell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /// TableViewCell Height
    /// - Parameters:
    ///   - tableView: Product TableView
    ///   - indexPath: Each row
    /// - Returns: Height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
    
}


// MARK:  - ProductTableView setups

extension ProductViewController {
    
    
    ///  Configuration for TableView
    func configureTableView() {
        productTableView.delegate   = self
        productTableView.dataSource = self
        setupProductTableViewConstraint()
    }
    
    
    
    /// setup ProductTableViewConstraint
    private func setupProductTableViewConstraint() {
        view.addSubview(productTableView)
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        productTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        productTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        productTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10).isActive = true
        productTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
    }
}


