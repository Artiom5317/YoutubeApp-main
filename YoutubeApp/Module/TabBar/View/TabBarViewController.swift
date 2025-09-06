//
//  TabBarViewController.swift
//  YoutubeApp
//
//  Created by Artiom on 30.08.25.
//

import UIKit

protocol TabBarViewProtocol: AnyObject {
    
}


class TabBarViewController: UITabBarController, TabBarViewProtocol {
    
    var presenter: TabBarPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabs()
    }

    func setTabs() {
        let homeVC = UINavigationController(rootViewController: Builder.createHomeViewController())
        homeVC.tabBarItem.title = "Home"
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        
        let shortsVC = ShortsView()
        shortsVC.tabBarItem.title = "Shorts"
        shortsVC.tabBarItem.image = UIImage(systemName: "heart")
        
        let createVC = CreateViewController()
        createVC.tabBarItem.image = UIImage(named: "PlusBar")
        
        
        let subscriptionVC = SubscriptionViewController()
        subscriptionVC.tabBarItem.title = "Subcription"
        subscriptionVC.tabBarItem.image = UIImage(systemName: "playstation.logo")
        
        let libraryVC = LibraryViewController()
        libraryVC.tabBarItem.title = "Library"
        libraryVC.tabBarItem.image = UIImage(systemName: "text.append")

        
        setViewControllers([homeVC, shortsVC, createVC, subscriptionVC, libraryVC], animated: true)
    }
    
    
    
}
