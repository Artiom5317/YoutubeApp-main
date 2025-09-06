//
//  ShortPresente.swift
//  YoutubeApp
//
//  Created by Artiom on 25.08.25.
//

import Foundation



protocol ShortPresenterProtocol: AnyObject {
    var shortItem: CollectionItem? {get}
    func setLike()
    func setDislike()
    func openComments()
    func subscribe()
}

class ShortPresenter: ShortPresenterProtocol {

    weak var view: ShortViewProtocol?
    var shortItem: CollectionItem?
    
    init(view: ShortViewProtocol, shortItem: CollectionItem) {
        self.view = view
        self.shortItem = shortItem
    }
    
    func setLike() {
        print("Set like")
    }
    
    func setDislike() {
        print("Set Dislike")
    }
    
    func openComments() {
        print("go to comments")
    }
    func subscribe() {
        print("subscribe to author")
    }
    
}
