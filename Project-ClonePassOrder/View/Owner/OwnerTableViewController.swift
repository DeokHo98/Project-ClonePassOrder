//
//  OwnerTableViewController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/06/14.
//

import UIKit

class OwnerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        OwnerViewModel().orderListFetch()
        navigationItem.hidesBackButton = true
        tabBarController?.tabBar.isHidden = true
        navigationItem.title = "빽다방 동두천지행점 주문리스트"
        tableView.separatorStyle = .none
        tableView.register(OwnerTableViewCell.self, forCellReuseIdentifier: "ownerCell")
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ownerCell") as! OwnerTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    

}
