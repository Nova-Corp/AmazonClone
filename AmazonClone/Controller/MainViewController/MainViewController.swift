//
//  MainViewController.swift
//  AmazonClone
//
//  Created by ADMIN on 13/04/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

enum CollectionViewCellType {
    case Rectangle
    case Square

    var size: CGSize {
        switch self {
        case .Rectangle:
            return CGSize(width: 210, height: 170)
        case .Square:
            return CGSize(width: 180, height: 180)
        }
    }
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
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier) as! MoviesTableViewCell
            cell.cellType = CollectionViewCellType.Square
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier) as! MoviesTableViewCell
            cell.cellType = CollectionViewCellType.Rectangle
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 51 added for other content's height.
        // 8 + 27 + 8 + 8 = 51

        if indexPath.row == 0 {
            return CollectionViewCellType.Square.size.height + 51
        } else {
            return CollectionViewCellType.Rectangle.size.height + 51
        }
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
