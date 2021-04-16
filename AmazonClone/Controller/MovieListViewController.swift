//
//  MovieListViewController.swift
//  AmazonClone
//
//  Created by ADMIN on 15/04/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    @IBOutlet var movieListCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let movieListNib = UINib(nibName: MoviePosterCollectionViewCell.identifier, bundle: nil)
        movieListCollectionView.register(movieListNib,
                                         forCellWithReuseIdentifier: MoviePosterCollectionViewCell.identifier)
    }
    @IBAction func didTapCloseButton(_ sender: UIButton) {

        view.removeFromSuperview()
    }
}

extension MovieListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MoviePosterCollectionViewCell.identifier,
            for: indexPath) as? MoviePosterCollectionViewCell
            else { return UICollectionViewCell()}

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width/2) - 15

        return CGSize(width: width, height: 100)
    }
}
