//
//  OrderHistoryViewController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/13.
//

import UIKit
import SnapKit

final class OrderHistoryViewController: UIViewController {

    // MARK: - UI Properties

    private let orderHistorTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        return tableView
    }()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigation()
        setOrderHistorTableView()
        setLayout()
    }

    // MARK: - setLayout

    private func setLayout() {
        view.addSubview(orderHistorTableView)
        orderHistorTableView.snp.makeConstraints({ make in
            make.leading.trailing.top.bottom.equalToSuperview()
        })
    }

    // MARK: - setorderHistorTableView

    private func setOrderHistorTableView() {
        orderHistorTableView.dataSource = self
        orderHistorTableView.delegate = self
        orderHistorTableView.register(OrderHistoryTableViewCell.self, forCellReuseIdentifier: "cellID")
        orderHistorTableView.register(OrderHistoryTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
    }

    // MARK: - setNavigation

    private func setNavigation() {
        navigationController?.isNavigationBarHidden = true
        title = "주문내역"
        let orderDateSelectButton = UIBarButtonItem()
        orderDateSelectButton.title = "2022년 05월 >"
        orderDateSelectButton.tintColor = .black
        navigationItem.leftBarButtonItem = orderDateSelectButton
        navigationItem.leftBarButtonItem?.target = self
        navigationItem.leftBarButtonItem?.action = #selector(orderDateSelectButtonTapped)
    }

    // MARK: - Inherited Method

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let orderHistorTableViewHeaderHeight = orderHistorTableView.headerView(forSection: 0)?.frame.height ?? 0
        if scrollView.contentOffset.y > orderHistorTableViewHeaderHeight {
            navigationController?.setNavigationBarHidden(false, animated: true)
        } else {
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }

    // MARK: - Methods

    @objc private func orderDateSelectButtonTapped() {
        let alert = UIAlertController(title: "나의 주문 내역", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        
        let selectMonthViewController = UIViewController()
        selectMonthViewController.view.backgroundColor = .gray
        
        alert.setValue(selectMonthViewController, forKey: "contentViewController")
        
        present(alert, animated: true)
    }
    @objc private func reorderButtonTapped() {
        let nextViewController = UINavigationController(rootViewController: ReorderViewController())
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true)
    }
    @objc private func writeStoryButtonTapped() {
        let nextViewController = WriteStoryViewController()
        nextViewController.navigationController?.setToolbarHidden(false, animated: true)
        nextViewController.navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension OrderHistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as? OrderHistoryTableViewCell else {
            return UITableViewCell()
        }
        cell.reorderButton.addTarget(self, action: #selector(reorderButtonTapped), for: .touchUpInside)
        cell.writeStoryButton.addTarget(self, action: #selector(writeStoryButtonTapped), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? OrderHistoryTableViewHeaderView else {
            return UIView()
        }
        headerView.orderDateSelectButton.addTarget(self, action: #selector(orderDateSelectButtonTapped), for: .touchUpInside)
        return headerView
    }
}
