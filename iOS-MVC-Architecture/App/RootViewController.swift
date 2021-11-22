//
//  RootViewController.swift
//  iOS-MVC-Architecture
//
//  Created by Pavel Palancica on 11/22/21.
//

import UIKit

class RootViewController: UIViewController {

    private lazy var mainTabbarVC: MainTabBarController = {
        let tabbarVC = MainTabBarController()
        
        let feedTabBarItem = UITabBarItem(title: "Feed", image: nil, tag: 0)
        let profileTabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 1)
        let settingsTabBarItem = UITabBarItem(title: "Settings", image: nil, tag: 2)
        
        let feedVC = FeedViewController()
        feedVC.title = "Feed"
        feedVC.tabBarItem = feedTabBarItem
        let profileVC = ProfileViewController()
        profileVC.title = "Profile"
        profileVC.tabBarItem = profileTabBarItem
        let settingsVC = SettingsViewController()
        settingsVC.title = "Settings"
        settingsVC.tabBarItem = settingsTabBarItem
        
        let feedNC = UINavigationController(rootViewController: feedVC)
        let profileNC = UINavigationController(rootViewController: profileVC)
        let settingsNC = UINavigationController(rootViewController: settingsVC)
        
        tabbarVC.viewControllers = [feedNC, profileNC, settingsNC]
        tabbarVC.navigationItem.hidesBackButton = true
        
        return tabbarVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(mainTabbarVC, animated: false)
    }
}

