//
//  CategoryViewController.swift
//  iShop
//
//  Created by Mommo Sadeghi on 29/06/23.
//

import UIKit

class CategoryViewController: UIViewController {


    // MARK:  - Variables

//    var categories = [CategoryModel]()
//    private var categoryView = Ca

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "CategoryVCBackgroundColor")
        configureTableView()
        setupCategoryTableViewConstraint()
    }

    var categories : [CategoryModel] = [
        CategoryModel(title: "Kylo", image: nil),
        CategoryModel(title: "Cooper", image: nil)

    ]


        // MARK:  -    UI Outlets
    private lazy var categoryTableView : UITableView = {
        let table             = UITableView()
        table.register(CategoryCell.self, forCellReuseIdentifier: Constants.categoryCellIdentifier)
        table.backgroundColor = UIColor(named: "CategoryVCBackgroundColor")
        return table
    }()

    ///  Configuration for TableView
    func configureTableView() {
        categoryTableView.delegate        = self
        categoryTableView.dataSource      = self

//        categoryTableView.backgroundColor = UIColor(named: "pokemonsViewControllerBackground")
    }



    /// setup CategoryTableViewConstraint
    private func setupCategoryTableViewConstraint() {
        view.addSubview(categoryTableView)
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
        categoryTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        categoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10).isActive = true
    }

}


extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.categoryCellIdentifier, for: indexPath) as? CategoryCell else { return UITableViewCell() }
//        cell.accessoryType = .disclosureIndicator
//        cell.accessoryView?.backgroundColor = UIColor(named: "CategoryCellContentColor")
        let categoryItems = categories[indexPath.row]
        cell.categoryItem = categoryItems
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    


}





//class CategoryViewController: UIViewController {
//
//    // MARK: - Variables
//
//    private var viewModel: CategoryViewModel!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = UIColor(named: "CategoryVCBackgroundColor")
//
//        viewModel = CategoryViewModel()
//
//        configureTableView()
//        setupCategoryTableViewConstraint()
//
//        viewModel.fetchCategories()
//    }
//
//    // MARK: - UI Outlets
//
//    private lazy var categoryTableView: UITableView = {
//        let table = UITableView()
//        table.register(CategoryCell.self, forCellReuseIdentifier: Constants.categoryCellIdentifier)
//        table.backgroundColor = UIColor(named: "CategoryVCBackgroundColor")
//        return table
//    }()
//
//    // MARK: - Configuration for TableView
//
//    private func configureTableView() {
//        categoryTableView.delegate = self
//        categoryTableView.dataSource = self
//    }
//
//    // MARK: - Setup CategoryTableViewConstraint
//
//    private func setupCategoryTableViewConstraint() {
//        view.addSubview(categoryTableView)
//        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
//        categoryTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        categoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
//        categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
//        categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10).isActive = true
//    }
//}
//
//extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.numberOfCategories()
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.categoryCellIdentifier, for: indexPath) as? CategoryCell else {
//            return UITableViewCell()
//        }
//        cell.accessoryType = .disclosureIndicator
//        let categoryItems = viewModel.category(at: indexPath.row)
//        cell.categoryItem = categoryItems
//        return cell
//    }
//}
