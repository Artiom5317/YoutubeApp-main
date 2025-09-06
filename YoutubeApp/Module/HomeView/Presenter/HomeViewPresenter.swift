//
//  HomeViewPresenter.swift
//  YoutubeApp
//
//  Created by Artiom on 20.08.25.
//

import Foundation


protocol HomeViewPresenterProtocol: AnyObject {
    var collectionData: [CollectiomSection] {get set}
    func didTriggerFilterWithIndexPath(indexPath: IndexPath)
    
}

class HomeViewPresenter: HomeViewPresenterProtocol {
    weak var view: HomeViewProtocol?
    
    var selectedFilter: String? {
        didSet {
            guard let filter = selectedFilter else { return }
            if filter == "All" {
                collectionData = CollectiomSection.mockData()
            } else {
                var newCollectionData: [CollectiomSection] = []
                for (index, section) in CollectiomSection.mockData().enumerated() {
                    if index == 0 {
                        let changedItems = section.items.map {
                            var newItem = $0
                            newItem.isSelected = (newItem.filterTitle == filter)
                            return newItem
                        }
                        newCollectionData.append(CollectiomSection(items: changedItems))
                    } else {
                        let newItems = section.items.filter {
                            $0.category == filter
                        }
                        newCollectionData.append(CollectiomSection(items: newItems))
                    }
                }
                collectionData = newCollectionData
            }
        }
    }
    
    var collectionData: [CollectiomSection] = CollectiomSection.mockData(){
        didSet {
            view?.reloadData()
        }
    }
    
    init(view: HomeViewProtocol) {
        self.view = view
    }
    
    func didTriggerFilterWithIndexPath(indexPath: IndexPath) {
        let filter = CollectiomSection.mockData()[indexPath.section].items[indexPath.item].filterTitle ?? ""
        selectedFilter = filter
    }
}
