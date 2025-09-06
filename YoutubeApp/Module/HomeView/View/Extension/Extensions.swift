//
//  Extensions.swift
//  YoutubeApp
//
//  Created by Artiom on 30.08.25.
//

import UIKit


extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ShortsHeaderView.reuseIdentifier,
                for: indexPath
            ) as! ShortsHeaderView
            return header
        }
        return UICollectionReusableView()
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter.collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.collectionData[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = presenter.collectionData[indexPath.section].items[indexPath.item]
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCell.reuseIdentifier, for: indexPath) as! FilterCell
            cell.setupCell(with: item)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCell.reuseIdentifier, for: indexPath) as! VideoCell
            cell.setupCell(with: item)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortCell.reuseIdentifier, for: indexPath) as! ShortCell
            cell.setupCell(with: item)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCell.reuseIdentifier, for: indexPath) as! VideoCell
            cell.setupCell(with: item)
            return cell
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            self.presenter.didTriggerFilterWithIndexPath(indexPath: indexPath)
        }
        
        if indexPath.section == 2 {
            let item = presenter.collectionData[2].items[indexPath.item]
            let shortVC = Builder.createShortsViewController(shortItem: item)
            shortVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(shortVC, animated: true)
        }
    }
}
