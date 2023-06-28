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
        view.backgroundColor = .brown
        configureTabBarController()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    
        // MARK:  - Methods

    /// Configuring TabBarController
    private func configureTabBarController() {
        mainTabBarViewController.tabBar.tintColor       = .white
    }


}

