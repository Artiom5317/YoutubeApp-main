//
//  VideoCell.swift
//  YoutubeApp
//
//  Created by Artiom on 21.08.25.
//

import UIKit


class VideoCell: UICollectionViewCell, CollectionViewCellProtocol {
    static var reuseIdentifier: String = "VideoCell"
    lazy var videoPreviewImageView: UIImageView = {
        $0.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 215)
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    let videoInfoView = VideoInfoView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        addSubviews(videoPreviewImageView, videoInfoView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        videoInfoView.frame = CGRect(
            x: 12,
            y: videoPreviewImageView.frame.maxY + 14,
            width: bounds.width - 24,
            height: 54
        )
    }
    
    func setupCell(with item: CollectionItem) {
        videoPreviewImageView.image = UIImage(named: item.preview ?? "")
        videoInfoView.profileImageView.image = UIImage(named: item.channelImage ?? "")
        videoInfoView.videoTitleLabel.text = item.title ?? ""
        videoInfoView.viewsAndDateLabel.text = "\(item.views ?? "0") views| \(item.uploadDate ?? "")"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class VideoInfoView: UIView {
    
    let profileImageView: UIImageView = .createImage(radius: 18, contentMode: .scaleAspectFit)
    let videoTitleLabel: UILabel = .createLabel(lines: 2, textColor: .black, font: .systemFont(ofSize: 14, weight: .medium))
    let viewsAndDateLabel: UILabel = .createLabel(lines: 1, textColor: .gray, font: .systemFont(ofSize: 12, weight: .medium))
    let detailsButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        videoTitleLabel.lineBreakMode = .byTruncatingTail
        addSubviews(profileImageView, videoTitleLabel, viewsAndDateLabel, detailsButton)
        setupButton()
    }
    
    func setupButton() {
        detailsButton.setImage(UIImage(named: "vericalDots"), for: .normal)
        detailsButton.tintColor = .black
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.frame.size = CGSize(
            width: Layout.Size.button,
            height: Layout.Size.button
        )
        
        profileImageView.frame.origin = .zero
        
        let availableWidth = bounds.width - profileImageView.frame.width - Layout.Padding.medium - detailsButton.frame.width
        let maxHeight: CGFloat = 36
        let maxSize = CGSize(width: availableWidth, height: maxHeight)
        let videoText = videoTitleLabel.text ?? ""
        let boundingRect = (videoText as NSString).boundingRect(
            with: maxSize,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: [.font: videoTitleLabel.font as Any],
            context: nil
        )
        
        let calculatedHeight = ceil(boundingRect.height)
        let finalHeight = min(calculatedHeight, maxHeight)
        
        videoTitleLabel.frame.size = CGSize(width: availableWidth, height: finalHeight)
        videoTitleLabel.frame.origin = CGPoint(x: profileImageView.frame.maxX + Layout.Padding.medium, y: 0)
        
        viewsAndDateLabel.frame.size = CGSize(width: availableWidth, height: 14)
        viewsAndDateLabel.frame.origin = CGPoint(x: profileImageView.frame.maxX + Layout.Padding.medium, y: videoTitleLabel.frame.maxY + Layout.Padding.small)
        
        detailsButton.frame.size = CGSize(width: Layout.Size.iconSize, height: Layout.Size.iconSize)
        detailsButton.frame.origin = CGPoint(x: videoTitleLabel.frame.maxX, y: 0)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
