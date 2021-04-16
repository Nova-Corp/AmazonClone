//
//  UIButton+Extension.swift
//  Zom-UI-Design
//
//  Created by ADMIN on 25/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.white.cgColor)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
}

@IBDesignable
class ButtonWithBelowLabel: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        if let imageView = self.imageView {
            imageView.frame.origin.x = (bounds.size.width - imageView.frame.size.width) / 2.0
            imageView.frame.origin.y = 0.0
        }
        if let titleLabel = self.titleLabel {
            titleLabel.frame.origin.x = (bounds.size.width - titleLabel.frame.size.width) / 2.0
            titleLabel.frame.origin.y = bounds.size.height - titleLabel.frame.size.height
        }
    }
}

extension UIButton {
    // 0 - .scaleToFill
    // 1 - .scaleAspectFit
    // 2 - .scaleAspectFill

    @IBInspectable
    var imageContentMode: Int {
        get {
            return imageView?.contentMode.rawValue ?? 0
        }
        set {
            if let mode = UIView.ContentMode(rawValue: newValue),
                self.imageView != nil {
                self.imageView?.contentMode = mode
            }
        }
    }

    func horizontalTitle(with image: UIImage, space: CGFloat) {
        setImage(image, for: .normal)
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.centerYAnchor.constraint(equalTo: centerYAnchor,
                                            constant: 0.0).isActive = true
        imageView?.trailingAnchor.constraint(equalTo: trailingAnchor,
                                             constant: -space + imageView!.frame.width).isActive = true
    }
}
