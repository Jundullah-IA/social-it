//
//  ViewController.swift
//  social-it
//
//  Created by Jundullah Ilhaq Aulia on 08/10/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        homeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")

        let searchVC = UINavigationController(rootViewController: SearchViewController())
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        let notificationVC = UINavigationController(rootViewController: NorificationViewController())
        notificationVC.tabBarItem.image = UIImage(systemName: "bell")
        notificationVC.tabBarItem.selectedImage = UIImage(systemName: "bell.fill")
        
        let directMessageVC = UINavigationController(rootViewController: DirectMessageViewController())
        directMessageVC.tabBarItem.image = UIImage(systemName: "envelope")
        directMessageVC.tabBarItem.selectedImage = UIImage(systemName: "envelope.fill")
        
        setViewControllers([homeVC, searchVC, notificationVC, directMessageVC], animated: true)
        
    }
}

