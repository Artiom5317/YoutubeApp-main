//
//  Builder.swift
//  YoutubeApp
//
//  Created by Artiom on 20.08.25.
//

import UIKit


class Builder {
    
    static func createTabBarView() -> UIViewController {
        let view = TabBarViewController()
        let presenter = TabBarPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func createHomeViewController() -> UIViewController {
        let view = HomeViewController()
        let presenter = HomeViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func createShortsViewController(shortItem: CollectionItem) -> UIViewController {
        let view = ShortsViewController()
        let presenter = ShortPresenter(view: view, shortItem: shortItem)
        view.presenter = presenter
        return view
    }
}
