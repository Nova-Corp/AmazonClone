//
//  MoviePosterCollectionViewCell.swift
//  AmazonClone
//
//  Created by ADMIN on 14/04/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class MoviePosterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

        
    }

    override func layoutSubviews() {
        super.layoutSubviews()

    }

    func configureGradientWithTitle(title: String) {
        
        
        // Configure gradient layer
        let gradientLayer = CAGradientLayer()

        gradientLayer.masksToBounds = true

        gradientLayer.frame = bounds

        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.5).cgColor
        ]

        contentView.layer.addSublayer(gradientLayer)
        
        // Configure label
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        titleLabel.text = "English"
        
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
        ])
        
    }
}
