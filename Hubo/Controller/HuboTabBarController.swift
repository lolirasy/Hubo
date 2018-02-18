//
//  HuboTabBarController.swift
//  Hubo
//
//  Created by ភី ម៉ារ៉ាសុី on 2/17/18.
//  Copyright © 2018 ភី ម៉ារ៉ាសុី. All rights reserved.
//

import UIKit

class HuboTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let newsFeedController = HuboNewsFeedController.initialNib()
        let discoverController = HuboDiscoverController.initialNib()
        let searchController = HuboSearchController.initialNib()
        let profileController = HuboProfileController.initialNib()
        viewControllers = [newsFeedController, discoverController, searchController, profileController]
    }

}
