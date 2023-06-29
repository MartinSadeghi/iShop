//
//  ViewController.swift
//  iShop
//
//  Created by Mommo Sadeghi on 28/06/23.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainTabBarViewController = UITabBarController()

     
    
    
        // MARK:  - Application LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarController()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTabBarController()
    }
    
    
    
        // MARK:  - Methods
    
    /// Configuring TabBarController
    private func configureTabBarController() {
        mainTabBarViewController.tabBar.backgroundColor = UIColor(named: "TabBarBackgroundColor")
        mainTabBarViewController.tabBar.tintColor = .white
    }
    
    /// Setting up TabBarConstraint
    private func setupTabBarController() {
        let allReminderViewController = UINavigationController(rootViewController: CategoryViewController())
        allReminderViewController.tabBarItem.image = UIImage(systemName: "house")
        allReminderViewController.tabBarItem.title = "Categories"
        allReminderViewController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")

        let savedRemindersViewController = UINavigationController(rootViewController: SaveViewController())
        savedRemindersViewController.tabBarItem.image = UIImage(systemName: "opticaldiscdrive")
        savedRemindersViewController.tabBarItem.selectedImage = UIImage(systemName: "opticaldiscdrive.fill")
        savedRemindersViewController.tabBarItem.title = "Saved"


        mainTabBarViewController.setViewControllers([allReminderViewController, savedRemindersViewController], animated: false)
        mainTabBarViewController.modalPresentationStyle = .fullScreen
        present(mainTabBarViewController, animated: true)

    }



}

