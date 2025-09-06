//
//  ShortsViewController.swift
//  YoutubeApp
//
//  Created by Artiom on 25.08.25.
//

import UIKit

protocol ShortViewProtocol: AnyObject { }

class ShortsViewController: UIViewController, ShortViewProtocol {
    
    var presenter: ShortPresenterProtocol!
    
    lazy var shortsImage: UIImageView = {
        $0.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: presenter.shortItem?.preview ?? "")
        return $0
    }(UIImageView())
    
    let bottomView = BottomUIView()
    let rightView = RightBarView()
    
    let videoText = UILabel.createLabel(lines: 0, textColor: .white, font: .systemFont(ofSize: 16, weight: .regular))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.addSubviews(shortsImage, bottomView, rightView, videoText)
        videoText.text =  "\(presenter.shortItem?.title ?? "No Text") \(presenter.shortItem?.descriptionText ?? "No Description")"
        setupBottomView()
        setupRightView()
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left"),
            style: .plain,
            target: self,
            action: #selector(backToHome)
        )
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func backToHome() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupBottomView() {
        bottomView.frame = CGRect(x: Layout.Padding.small * 2, y: view.frame.maxY - 80, width: view.frame.width - 16 - 52, height: 28)
        bottomView.channelImageView.image = UIImage(named: presenter.shortItem?.channelImage ?? "")
        bottomView.channelName.text = presenter.shortItem?.channelName ?? "No name"
        
        bottomView.onSubscribeTapped = { [weak self] in
            guard let self = self else { return }
            self.presenter.subscribe()
        }
    }
    
    private func setupRightView() {
        rightView.frame = CGRect(
            x: view.frame.maxX - 16 - 36,
            y: view.frame.maxY - 368 - 52,
            width: 36,
            height: 368
        )
        rightView.likeCoundLabel.text = "\(presenter.shortItem?.likesCount ?? "0")"
        rightView.dislikeCoundLabel.text = "Dislike"
        rightView.commentCountLabel.text = "\(presenter.shortItem?.commentsCount ?? "0")"
        rightView.shareLabel.text = "Share"
        
        rightView.onLikeTap = { [weak self] in
            guard let self = self else { return }
            self.presenter.setLike()
        }
        
        rightView.onDislikeTap = { [weak self] in
            guard let self = self else { return }
            self.presenter.setDislike()
        }
        
        rightView.onCommentTap = { [weak self] in
            guard let self = self else { return }
            self.presenter.openComments()
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let sexteenWidth = Layout.Padding.small * 2
        let availableWidth = view.bounds.width - Layout.Padding.huge - rightView.frame.width - 40
        
        let maxHeight: CGFloat = 80
        let maxSize = CGSize(width: availableWidth, height: maxHeight)
        let videoText = videoText.text ?? ""
        
        let boundingRect = (videoText as NSString).boundingRect(
            with: maxSize,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: [.font: self.videoText.font as Any],
            context: nil
        )
        let calculatedHeight = ceil(boundingRect.height)
        let finalHeight = min(calculatedHeight, maxHeight)
        
        self.videoText.frame = CGRect(
            x: sexteenWidth,
            y: bottomView.frame.minY - sexteenWidth - finalHeight,
            width: availableWidth,
            height: finalHeight
        )
    }
    

}
