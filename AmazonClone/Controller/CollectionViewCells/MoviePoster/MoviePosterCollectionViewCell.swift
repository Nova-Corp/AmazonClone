//
//  MoviePosterCollectionViewCell.swift
//  AmazonClone
//
//  Created by ADMIN on 14/04/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class MoviePosterCollectionViewCell: UICollectionViewCell {
    @IBOutlet var thumbnailImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureGradientWithTitle(title: String) {
        // Configure gradient layer

        if contentView.layer.sublayers?.count == 1 {
            let gradientLayer = CAGradientLayer()

            gradientLayer.frame = bounds

            gradientLayer.colors = [
                UIColor.clear.cgColor,
                UIColor.black.withAlphaComponent(0.5).cgColor
            ]

            contentView.layer.addSublayer(gradientLayer)
        }

        // Configure label
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        titleLabel.text = "English"

        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8)
        ])
    }
}
