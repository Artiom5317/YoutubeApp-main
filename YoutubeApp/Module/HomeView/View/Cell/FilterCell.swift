//
//  FilterCell.swift
//  YoutubeApp
//
//  Created by Artiom on 21.08.25.
//

import UIKit

protocol CollectionViewCellProtocol {
    static var reuseIdentifier: String { get set }
    func setupCell(with item: CollectionItem)
}


final class FilterCell: UICollectionViewCell, CollectionViewCellProtocol{
    static var reuseIdentifier: String = "FilterCell"
    
    let filterText: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(filterText)
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        filterText.frame = contentView.bounds
    }
    

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        guard let text = filterText.text else { return attributes }
        let textSize = (text as NSString).size(withAttributes: [.font: filterText.font as Any])
        let width = textSize.width + 24
        let height = layoutAttributes.size.height
        attributes.frame.size = CGSize(width: width, height: height)
        return attributes
    }
    
    func setupCell(with item: CollectionItem) {
        filterText.text = item.filterTitle ?? "No filter"
        if item.isSelected == true {
            contentView.backgroundColor = .black
        } else {
            contentView.backgroundColor = .lightGray
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
