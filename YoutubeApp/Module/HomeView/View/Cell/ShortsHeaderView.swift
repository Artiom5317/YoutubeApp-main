//
//  ShortsHeaderView.swift
//  YoutubeApp
//
//  Created by Artiom on 30.08.25.
//

import UIKit


class ShortsHeaderView: UICollectionReusableView {
    static var reuseIdentifier = "ShortsHeaderView"
    
    private let titleLabel = UILabel.createLabel(lines: 1, textColor: .black, font: .systemFont(ofSize: 18, weight: .semibold))
    private let shortsImage = UIImageView.createImage(contentMode: .scaleToFill)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.text = "Shorts"
        shortsImage.image = UIImage(named: "shortsPreview")
        addSubview(titleLabel)
        addSubview(shortsImage)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shortsImage.frame = CGRect(
            x: 0,
            y: 0,
            width: 24,
            height: 29
        )
        
        titleLabel.frame = CGRect(
            x: shortsImage.frame.maxX + 8,
            y: 0,
            width: 80,
            height: 29
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
