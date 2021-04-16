//
//  MainViewController.swift
//  AmazonClone
//
//  Created by ADMIN on 13/04/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

enum CollectionViewCellType {
    case rectangle
    case square
    case longRectangle

    var size: CGSize {
        switch self {
        case .rectangle:
            return CGSize(width: 200, height: 100)
        case .square:
            return CGSize(width: 200, height: 200)
        case .longRectangle:
            return CGSize(width: 300, height: 100)
        }
    }
}

enum ButtonType {
    case more
    case normal
}

class MainViewController: UIViewController {
    @IBOutlet var logoTopConstraint: NSLayoutConstraint!

    @IBOutlet var mainTableView: UITableView!

    var lastOffsetY: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        let latestMovieCellNib = UINib(nibName: MoviesTableViewCell.identifier, bundle: nil)
        mainTableView.register(latestMovieCellNib, forCellReuseIdentifier: MoviesTableViewCell.identifier)
    }

    @IBAction func segmentSelected(_ sender: CustomSegmentedControl) {
        print(sender.selectedSegmentedIndex)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MoviesTableViewCell.identifier)
            as? MoviesTableViewCell else { return UITableViewCell() }

        if indexPath.row == 0 {
            cell.cellType = CollectionViewCellType.square
        } else {
            cell.cellType = CollectionViewCellType.rectangle
            cell.detailsButtonType = .more
            cell.detailsButton.addTarget(self, action: #selector(didTapDetailsMoreButton(_:)), for: .touchUpInside)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 51 added for other content's height.
        // 8 + 27 + 8 + 8 = 51

        if indexPath.row == 0 {
            return CollectionViewCellType.square.size.height + 51
        } else {
            return CollectionViewCellType.rectangle.size.height + 51
        }
    }

    @objc private func didTapDetailsMoreButton(_ sender: UIButton) {
        let movieListViewController = MovieListViewController.instantiate()

        movieListViewController.view.frame.size.height = view.frame.height

        view.addSubview(movieListViewController.view)
        addChild(movieListViewController)
        movieListViewController.didMove(toParent: self)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if lastOffsetY > scrollView.contentOffset.y {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.logoTopConstraint.constant = 16
                self?.view.layoutIfNeeded()
            }
        } else if lastOffsetY < scrollView.contentOffset.y {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.logoTopConstraint.constant = -48
                self?.view.layoutIfNeeded()
            }
        }

        lastOffsetY = scrollView.contentOffset.y
    }
}
