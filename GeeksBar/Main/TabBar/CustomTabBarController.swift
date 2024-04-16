//
//  CustomTabBarController.swift
//  GeeksBar
//
//  Created by Abdylda Mamashev on 11/4/24.
//

import UIKit

final class CustomTabBarController: UITabBarController {
    
    private let customTabBar = CustomTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValue(customTabBar, forKey: "tabBar")
        setupTabItems()
        setupNavigationItem()
    }
    
    private func setupTabItems() {
        
        let firstVC = MainViewController()
        firstVC.tabBarItem.image = UIImage(systemName: "house")
        
        let secondVC = ChatViewController()
        secondVC.tabBarItem.image = UIImage(systemName: "star")
        
        let thirdVC = NavigationViewController()
        thirdVC.tabBarItem.image = UIImage(systemName: "safari")
        
        let fourthVC = ProfileViewController()
        fourthVC.tabBarItem.image = UIImage(systemName: "person")
        
        setViewControllers([firstVC, secondVC, thirdVC, fourthVC], animated: true)
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Home"
        navigationItem.hidesBackButton = true
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "bell"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(notificationTapped))
        
        navigationItem.rightBarButtonItem = rightButton
        rightButton.tintColor = .black
    }
    
    @objc
    private func notificationTapped() {
        
    }
    
}
