//
//  CustomTabBarController.swift
//  AmazonClone
//
//  Created by ADMIN on 13/04/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

struct TabItem {
    let itemTitle: String
    let defaultImage: UIImage
    let selectedImage: UIImage
    let viewController: UIViewController
}

class CustomTabBarController: UIViewController {
    @IBOutlet var contentView: UIView!

    let selectedIndex = 0

    var tabItems: [TabItem]!

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async { [weak self] in
            self?.selectedTabItem(is: self!.selectedIndex + 1)
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        UIStatusBarStyle.lightContent
    }

    @IBAction func didTapTabBarItem(_ sender: UIButton) {
        selectedTabItem(is: sender.tag)
    }

    private func selectedTabItem(is index: Int) {

        let homeVC = MainViewController.instantiate()
        let findVC = CloudViewController.instantiate()
        let downloadVC = FolderViewController.instantiate()
        let myStuffVC = TrayViewController.instantiate()

        tabItems = [
            TabItem(itemTitle: "Home",
                    defaultImage: #imageLiteral(resourceName: "home"),
                    selectedImage: #imageLiteral(resourceName: "home-select"),
                    viewController: homeVC),
            TabItem(itemTitle: "Find",
                    defaultImage: #imageLiteral(resourceName: "search"),
                    selectedImage: #imageLiteral(resourceName: "search-select"),
                    viewController: findVC),
            TabItem(itemTitle: "Download",
                    defaultImage: #imageLiteral(resourceName: "download"),
                    selectedImage: #imageLiteral(resourceName: "download-select"),
                    viewController: downloadVC),
            TabItem(itemTitle: "My Stuff",
                    defaultImage: #imageLiteral(resourceName: "user"),
                    selectedImage: #imageLiteral(resourceName: "user"),
                    viewController: myStuffVC)
        ]

        for item in 1 ... tabItems.count {
            let tabItem = view.viewWithTag(item) as? UIButton

            if index == item {
                tabItem?.setImage(tabItems[item - 1].selectedImage, for: .normal)
                tabItem?.setTitleColor(#colorLiteral(red: 0.2449563742, green: 0.5731687546, blue: 0.6908303499, alpha: 1), for: .normal)
            } else {
                tabItem?.setImage(tabItems[item - 1].defaultImage, for: .normal)
                tabItem?.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            }
        }

        let item = tabItems[index - 1].viewController

        item.view.frame.size.height = contentView.frame.height

        contentView.addSubview(item.view)
        item.didMove(toParent: self)
    }
}
