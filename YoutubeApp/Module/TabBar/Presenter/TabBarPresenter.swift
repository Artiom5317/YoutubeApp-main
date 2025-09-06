//
//  TabBarPresenter.swift
//  YoutubeApp
//
//  Created by Artiom on 30.08.25.
//

import Foundation

protocol TabBarPresenterProtocol: AnyObject {
    
}

class TabBarPresenter: TabBarPresenterProtocol {
    weak var view: TabBarViewProtocol?
    
    init(view: TabBarViewProtocol) {
        self.view = view
    }
}
