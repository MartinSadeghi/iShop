//
//  CategoryViewController.swift
//  iShop
//
//  Created by Mommo Sadeghi on 29/06/23.
//

import UIKit

class CategoryViewController: UIViewController {
    
    
    // MARK:  - Variables
    
    private var categoryViewModel = CategoryViewModel()
    
    var categoriesFake : [CategoryModelFake] = [
        CategoryModelFake(title: "Kylo")
        //        CategoryModel(title: "Cooper"),
        //        CategoryModel(title: "Miely")
    ]
    
   
    
    
    
    
    // MARK:  - Application Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "CategoryVCBackgroundColor")
        initCategoryViewModel()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    
    
    
    // MARK:  - Methods
    
    private func initCategoryViewModel() {
        observeEventsForCategories()
        categoryViewModel.fetchCategory()
    }
    
    private func observeEventsForCategories() {
        categoryViewModel.eventHandler = { [weak self] event in
            switch event {
            case.loading:
                /// showing Indicator
                print("Data is loading...!")
            case .stopLoading:
                /// stop showing Indicator
                print("Stop loading..!.")
            case .dataLoaded:
                print("Data loaded.")
                DispatchQueue.main.async {
                    self?.categoryTableView.reloadData()
                }
            case .error(let error):
                print(error?.localizedDescription as Any)
            }
            
        }
    }

  
    // MARK:  -    UI Outlets
    
    /// Creating CategoryTableViewl
    private lazy var categoryTableView : UITableView = {
        let table             = UITableView()
        table.register(CategoryCell.self, forCellReuseIdentifier: Constants.categoryCellIdentifier)
        table.backgroundColor = UIColor(named: "CategoryVCBackgroundColor")
        return table
    }()
    
}



// MARK:  - CategoryTableView required protocols

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoryViewModel.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.categoryCellIdentifier, for: indexPath) as? CategoryCell else { return UITableViewCell() }
        let categoryItems = categoryViewModel.categories[indexPath.row]
        cell.categoryItem = [categoryItems]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedRow = indexPath.row
        let productViewController = ProductViewController(product: Product(id: selectedRow, title: "", description: "", price: selectedRow, discountPercentage: Double(selectedRow), rating: Double(selectedRow), stock: selectedRow, brand: "", category: categoryViewModel.categories[selectedRow], thumbnail: "", images: []))
        navigationController?.pushViewController(productViewController, animated: true)
        let selectedData = categoryViewModel.categories[selectedRow]
        print("selectedData from CategoryVC \(selectedData)")
    }
}


// MARK:  - CategoryTableView setups

extension CategoryViewController {
    
    
    ///  Configuration for TableView
    func configureTableView() {
        categoryTableView.delegate   = self
        categoryTableView.dataSource = self
        setupCategoryTableViewConstraint()
    }
    
    
    
    /// setup CategoryTableViewConstraint
    private func setupCategoryTableViewConstraint() {
        view.addSubview(categoryTableView)
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
        categoryTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        categoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10).isActive = true
        categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
    }
}



