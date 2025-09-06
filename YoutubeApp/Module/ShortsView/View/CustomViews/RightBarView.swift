//
//  RightBarView.swift
//  YoutubeApp
//
//  Created by Artiom on 28.08.25.
//

import UIKit

final class RightBarView: UIView {
    
    let detailsButton = UIButton()
    
    let likeButton = UIButton()
    let likeCoundLabel: UILabel = UILabel.createLabel(textColor: .white, font: .systemFont(ofSize: 12, weight: .medium), alignment: .center)
    
    let dislikeButton = UIButton()
    let dislikeCoundLabel: UILabel = UILabel.createLabel(textColor: .white, font: .systemFont(ofSize: 11, weight: .medium))
    
    let commentButton = UIButton()
    let commentCountLabel: UILabel = UILabel.createLabel(textColor: .white, font: .systemFont(ofSize: 12, weight: .medium), alignment: .center)
    
    let shareButton = UIButton()
    let shareLabel = UILabel.createLabel(textColor: .white, font: .systemFont(ofSize: 12, weight: .medium), alignment: .center)
    
    let soundButton = UIButton()
    
    
    var onLikeTap: (() -> Void)?
    var onDislikeTap: (() -> Void)?
    var onCommentTap: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        addSubviews(detailsButton, likeButton, likeCoundLabel, dislikeButton, dislikeCoundLabel, commentButton, commentCountLabel, shareButton, shareLabel, soundButton)
        
        setupActions()
    }
    
    func setupActions() {
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        dislikeButton.addTarget(self, action: #selector(dislikeButtonTapped), for: .touchUpInside)
        commentButton.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
    }
    
    @objc func likeButtonTapped() { onLikeTap?() }
    @objc func dislikeButtonTapped() { onDislikeTap?() }
    @objc func commentButtonTapped() { onCommentTap?() }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var currentY: CGFloat = 0
        let iconWidthAndHeight: CGFloat = 36
        let paddingBeetweenIconAndLabel: CGFloat = Layout.Spacing.betweenIconAndLabel
        let paddingBeetweenGroups: CGFloat = Layout.Spacing.betweenGroups
        let labelHeight: CGFloat = Layout.Size.labelHeight
        
        detailsButton.frame = CGRect(
            x: 0,
            y: currentY,
            width: iconWidthAndHeight,
            height: iconWidthAndHeight
        )
        currentY += iconWidthAndHeight + 2
        
        likeButton.frame = CGRect(
            x: 0,
            y: currentY,
            width: iconWidthAndHeight,
            height: iconWidthAndHeight
        )
        currentY += iconWidthAndHeight + paddingBeetweenIconAndLabel
        likeCoundLabel.frame = CGRect(
            x: 0,
            y: currentY,
            width: iconWidthAndHeight,
            height: labelHeight
        )
        currentY += labelHeight + paddingBeetweenGroups
        
        
        dislikeButton.frame = CGRect(
            x: 0,
            y: currentY,
            width: iconWidthAndHeight,
            height: iconWidthAndHeight
        )
        currentY += iconWidthAndHeight + paddingBeetweenIconAndLabel
        dislikeCoundLabel.frame = CGRect(
            x: 0,
            y: currentY,
            width: iconWidthAndHeight,
            height: labelHeight
        )
        currentY += labelHeight + paddingBeetweenGroups
        
        
        commentButton.frame = CGRect(
            x: 0,
            y: currentY,
            width: iconWidthAndHeight,
            height: iconWidthAndHeight
        )
        currentY += iconWidthAndHeight + paddingBeetweenIconAndLabel
        commentCountLabel.frame = CGRect(
            x: 0,
            y: currentY,
            width: iconWidthAndHeight,
            height: labelHeight
        )
        currentY += labelHeight + paddingBeetweenGroups
        
        shareButton.frame = CGRect(
            x: 0,
            y: currentY,
            width: iconWidthAndHeight,
            height: iconWidthAndHeight
        )
        currentY += iconWidthAndHeight + paddingBeetweenIconAndLabel
        shareLabel.frame = CGRect(
            x: 0,
            y: currentY,
            width: iconWidthAndHeight,
            height: labelHeight
        )
        
        currentY += labelHeight + paddingBeetweenGroups
        soundButton.frame = CGRect(
            x: 0,
            y: currentY,
            width: iconWidthAndHeight,
            height: iconWidthAndHeight
        )
        
    }
    
    func setupUI() {
        detailsButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        detailsButton.tintColor = .white
        
        likeButton.setImage(UIImage(named: "Like"), for: .normal)
        dislikeButton.setImage(UIImage(named: "disLike"), for: .normal)
        commentButton.setImage(UIImage(named: "comments"), for: .normal)
        shareButton.setImage(UIImage(named: "share"), for: .normal)
        
        soundButton.setImage(UIImage(named: "sound"), for: .normal)
        soundButton.clipsToBounds = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
