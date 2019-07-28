//
//  HuboNewsFeedController.swift
//  Hubo
//
//  Created by ភី ម៉ារ៉ាសុី on 2/17/18.
//  Copyright © 2018 ភី ម៉ារ៉ាសុី. All rights reserved.
//

import UIKit

class HuboNewsFeedController: UIViewController, NibIntializable {

    @IBOutlet weak var newsFeedTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        newsFeedTableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: "newsFeedCell")
    }

}

extension HuboNewsFeedController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsFeedCell", for: indexPath)
        return cell
    }

}

extension HuboNewsFeedController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 197
    }

}


