//
//  OwnerTableViewController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/06/21.
//

import UIKit

class OwnerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        OwnerViewModel().orderListFetch()
        navigationItem.hidesBackButton = true
        tabBarController?.tabBar.isHidden = true
        navigationItem.title = "빽다방 동두천지행점 주문리스트"
    }
}
