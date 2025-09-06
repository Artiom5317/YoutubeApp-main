//
//  BottomUIView.swift
//  YoutubeApp
//
//  Created by Artiom on 26.08.25.
//

import UIKit


final class BottomUIView: UIView {
    let channelImageView: UIImageView = UIImageView()
    let channelName: UILabel = UILabel()
    let subscribeButton = UIButton()
    
    var onSubscribeTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        addSubviews(channelImageView, channelName, subscribeButton)
    }

    func setupUI() {
        channelImageView.contentMode = .scaleAspectFill
        channelImageView.clipsToBounds = true
        channelImageView.layer.cornerRadius = 14
        
        channelName.font = .systemFont(ofSize: 14, weight: .bold)
        channelName.numberOfLines = 1
        channelName.textColor = .white
        channelName.textAlignment = .center
        channelName.lineBreakMode = .byTruncatingTail
        
        subscribeButton.layer.cornerRadius = 4
        subscribeButton.setTitle("SUBSCRIBE", for: .normal)
        subscribeButton.backgroundColor = .red
        subscribeButton.setTitleColor(.white, for: .normal)
        subscribeButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        subscribeButton.addTarget(self, action: #selector(subscribeTapped), for: .touchUpInside)
        
    }
    
    @objc func subscribeTapped() {
        onSubscribeTapped?()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let profileAndButtonHeight = Layout.Size.profileSize
        channelImageView.frame = CGRect(x: 0, y: 0, width: profileAndButtonHeight, height: profileAndButtonHeight)
        let channelText = channelName.text ?? ""
        let textAttributes: [NSAttributedString.Key: Any] = [.font: channelName.font as Any]
        let textSize = (channelText as NSString).size(withAttributes: textAttributes)
        channelName.frame = CGRect(
            x: channelImageView.frame.maxX + Layout.Padding.small,
            y: 0,
            width: min(textSize.width, 120),
            height: profileAndButtonHeight
        )
        subscribeButton.frame.size = CGSize(width: 98, height: profileAndButtonHeight)
        subscribeButton.frame.origin = CGPoint(x: channelName.frame.maxX + Layout.Padding.small, y: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
