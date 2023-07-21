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
    var searchedCategory = CategoryModel()
    var isSearching = false
    
    // MARK:  - Application Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.categoryVCBackgroundColor
        configureTableView()
        initCategoryViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Categories"
//        tabBarController?.tabBar.isHidden = false
    }
    
    
    
    
    // MARK:  - Methods
    
    /// Setup initializations of the CategoryViewModel
    private func initCategoryViewModel() {
        observeEventsForCategories()
        categoryViewModel.fetchCategories()
    }
    
    /// Observing the states of the Networking
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
    
    
    /// Creating ContainerView for categorySearchBar and categoryTableView
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    /// Creating categorySearchController
    private lazy var categorySearchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
//        navigationItem.searchController = searchBar
        definesPresentationContext = true
//        searchBar.searchResultsUpdater = self
        searchBar.delegate = self
        return searchBar
    }()
    
    /// Creating CategoryTableView
    private lazy var categoryTableView : UITableView = {
        let table             = UITableView()
        table.register(CategoryCell.self, forCellReuseIdentifier: Constants.categoryCellIdentifier)
        table.backgroundColor = UIColor.categoryVCBackgroundColor
        return table
    }()
    
}



// MARK:  - CategoryTableView required protocols

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        categoryViewModel.categories?.count ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.categoryCellIdentifier, for: indexPath) as? CategoryCell else { return UITableViewCell() }
//        guard let categoryItems = categoryViewModel.categories?[indexPath.row] else { return UITableViewCell() }
//        cell.categoryItem = [categoryItems]
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if isSearching {
                return searchedCategory.count
            } else {
                return categoryViewModel.categories?.count ?? 0
            }
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.categoryCellIdentifier, for: indexPath) as? CategoryCell else {
            return UITableViewCell()
        }
        
        let categoryItem: CategoryModel
        if isSearching {
            categoryItem = [searchedCategory[indexPath.row]]
        } else {
            guard let categoryItems = categoryViewModel.categories?[indexPath.row] else {
                return UITableViewCell()
            }
            categoryItem = [categoryItems]
        }
        
        cell.categoryItem = categoryItem // Pass the array directly to the cell
        
        return cell
    }

    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedRow = indexPath.row
        let productViewController = ProductViewController(product: Product(id: selectedRow, title: "", description: "", price: selectedRow, discountPercentage: Double(selectedRow), rating: Double(selectedRow), stock: selectedRow, brand: "", category: categoryViewModel.categories?[selectedRow] ?? "", thumbnail: "", images: []))
        navigationController?.pushViewController(productViewController, animated: true)
        let selectedData = categoryViewModel.categories?[selectedRow]
//        print("selectedData from CategoryVC \(selectedData ?? "Error by selectingRow")")
    }
}

    // MARK:  - UISearchBarDelegate required protocols

extension CategoryViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearching = !searchText.isEmpty

            searchedCategory = categoryViewModel.categories?.filter { item in
                return item.range(of: searchText, options: .caseInsensitive) != nil
            } ?? []
            DispatchQueue.main.async {
                self.categoryTableView.reloadData()
            }
        }
}


// MARK:  - CategoryTableView setups

extension CategoryViewController {
    
    
    ///  Configuration for CategoryTableView
    func configureTableView() {
        categoryTableView.delegate   = self
        categoryTableView.dataSource = self
        setupCategorySearchBar()
        setupCategoryTableViewConstraint()
    }
    

    
    
    /// Setup categorySearchBar
    private func setupCategorySearchBar() {
            view.addSubview(categorySearchBar)
            categorySearchBar.translatesAutoresizingMaskIntoConstraints = false
            categorySearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//            categorySearchBar.bottomAnchor.constraint(equalTo: categoryTableView.topAnchor, constant: 5).isActive = true
            categorySearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10).isActive = true
            categorySearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        }
    
    
    /// Setup CategoryTableViewConstraint
        private func setupCategoryTableViewConstraint() {
            view.addSubview(categoryTableView)
            categoryTableView.translatesAutoresizingMaskIntoConstraints = false
            categoryTableView.topAnchor.constraint(equalTo: categorySearchBar.bottomAnchor).isActive = true
            categoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
            categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10).isActive = true
            categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        }
    
    
    
}



