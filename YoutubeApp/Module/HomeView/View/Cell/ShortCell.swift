//
//  ShortCell.swift
//  YoutubeApp
//
//  Created by Artiom on 21.08.25.
//

import UIKit

class ShortCell: UICollectionViewCell, CollectionViewCellProtocol {
    static var reuseIdentifier: String = "ShortCell"
    
    lazy var previewImageView: UIImageView = {
        $0.frame.size = CGSize(width: bounds.width, height: Layout.Size.shortsHeight)
        $0.frame.origin = .zero
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    let viewsLabel: UILabel = .createLabel(lines: 1, textColor: .white, font: .systemFont(ofSize: 10, weight: .medium))
    
    let shortsTitle = UILabel.createLabel(lines: 0, textColor: .white, font: .systemFont(ofSize: 12, weight: .medium))
    
    let detailsButton = UIButton()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        shortsTitle.lineBreakMode = .byTruncatingTail
        addSubviews(previewImageView, viewsLabel, shortsTitle, detailsButton)
        
        detailsButton.tintColor = .white
        detailsButton.setImage(UIImage(systemName: "ellipsis.vertical.bubble"), for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
         let smallPadding = Layout.Padding.small
         let medPadding = Layout.Padding.medium
        
        viewsLabel.frame = CGRect(
            x: smallPadding,
            y: bounds.maxY - Layout.Padding.large,
            width: bounds.width - (smallPadding * 2),
            height: 12
        )
        
        let maxHeight: CGFloat = 44
        let availableWidth = bounds.width - (smallPadding * 2)
        let maxSize = CGSize(width: availableWidth, height: maxHeight)
        let titleText = shortsTitle.text ?? ""
        
        let boundingRect = (titleText as NSString).boundingRect(
            with: maxSize,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: [.font: shortsTitle.font as Any],
            context: nil
        )
        
        let calculatedHeight = ceil(boundingRect.height)
        let finalHeight = min(calculatedHeight, maxHeight)
        
        shortsTitle.frame.size = CGSize(width: availableWidth, height: finalHeight)
        shortsTitle.frame.origin = CGPoint(x: 8, y: viewsLabel.frame.minY - finalHeight - 8)
        
        detailsButton.frame.size = CGSize(width: Layout.Size.iconSize, height: Layout.Size.iconSize)
        detailsButton.frame.origin = CGPoint(x: bounds.width - Layout.Size.iconSize - smallPadding, y: 12)
    }
    
    func setupCell(with item: CollectionItem) {
        previewImageView.image = UIImage(named: item.preview ?? "")
        viewsLabel.text = "\(item.views ?? "0") views"
        shortsTitle.text = "\(item.title ?? "No title").."
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
