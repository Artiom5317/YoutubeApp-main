//
//  extensions.swift
//  YoutubeApp
//
//  Created by Artiom on 27.08.25.
//

import UIKit


extension UIImageView {
    static func createImage(radius: CGFloat? = nil, contentMode: UIView.ContentMode) -> UIImageView {
        let img = UIImageView()
        img.contentMode = contentMode
        img.clipsToBounds = true
        if let radius {
            img.layer.cornerRadius = radius
        }
        return img
    }
}

extension UILabel {
    static func createLabel(lines: Int = 1, textColor: UIColor, font: UIFont, alignment: NSTextAlignment? = nil) -> UILabel {
        let label = UILabel()
        label.numberOfLines = lines
        label.textColor = textColor
        label.font = font
        if let alignment {
            label.textAlignment = alignment
        }
        return label
    }
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
