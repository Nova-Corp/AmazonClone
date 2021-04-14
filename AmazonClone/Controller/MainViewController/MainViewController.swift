//
//  MainViewController.swift
//  AmazonClone
//
//  Created by ADMIN on 13/04/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var logoTopConstraint: NSLayoutConstraint!
    let homeViewController = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func segmentSelected(_ sender: CustomSegmentedControl) {
        print(sender.selectedSegmentedIndex)
    }
}

