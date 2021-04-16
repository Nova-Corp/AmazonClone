//
//  MoviesTableViewCell.swift
//  AmazonClone
//
//  Created by ADMIN on 14/04/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout {
    var cellType: CollectionViewCellType?
    var detailsButtonType: ButtonType?

    @IBOutlet var moviesCollectionView: UICollectionView!
    @IBOutlet var detailsButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self

        let moviePosterCollectionNib = UINib(nibName: MoviePosterCollectionViewCell.identifier, bundle: nil)
        moviesCollectionView.register(moviePosterCollectionNib,
                                      forCellWithReuseIdentifier: MoviePosterCollectionViewCell.identifier)
    }
}

extension MoviesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MoviePosterCollectionViewCell.identifier,
            for: indexPath) as? MoviePosterCollectionViewCell
            else {return UICollectionViewCell()}

        if cellType == CollectionViewCellType.square {
            cell.configureGradientWithTitle(title: "English")
        }

        if detailsButtonType == ButtonType.more {
            detailsButton.isUserInteractionEnabled = true
            detailsButton.setTitle("Movies", for: .normal)
            detailsButton.setImage(UIImage(systemName: "chevron.left")!, for: .normal)
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellType?.size ?? CollectionViewCellType.rectangle.size
    }
}
