//
//  MoviesTableViewCell.swift
//  AmazonClone
//
//  Created by ADMIN on 14/04/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet var moviesCollectionView: UICollectionView!
    
    var cellType: CollectionViewCellType?
    

    override func awakeFromNib() {
        super.awakeFromNib()

        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self

        let moviePosterCollectionNib = UINib(nibName: MoviePosterCollectionViewCell.identifier, bundle: nil)
        moviesCollectionView.register(moviePosterCollectionNib, forCellWithReuseIdentifier: MoviePosterCollectionViewCell.identifier)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviePosterCollectionViewCell.identifier, for: indexPath) as! MoviePosterCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellType?.size ?? CollectionViewCellType.Rectangle.size
    }
    
}
