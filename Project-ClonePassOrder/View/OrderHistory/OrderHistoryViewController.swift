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

    private let orderHistoryTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        return tableView
    }()

    var viewModel: OrderViewModel
    
    // MARK: - View Life Cycle
    init(viewModel: OrderViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setOrderHistoryTableView()
        setLayout()
        viewModel.model.bind { _ in
            self.orderHistoryTableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
    }

    // MARK: - setLayout

    private func setLayout() {
        view.backgroundColor = .white
        view.addSubview(orderHistoryTableView)
        orderHistoryTableView.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.snp.topMargin)
            make.bottom.equalTo(view.snp.bottomMargin)
        })
    }

    // MARK: - setOrderHistoryTableView

    private func setOrderHistoryTableView() {
        orderHistoryTableView.dataSource = self
        orderHistoryTableView.delegate = self
        orderHistoryTableView.register(
            OrderHistoryTableViewCell.self,
            forCellReuseIdentifier: "cellID"
        )
        orderHistoryTableView.backgroundColor = .systemGray5
    }

    // MARK: - setNavigation

    private func setNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "주문내역"
    }

    // MARK: - Methods
    
    private func fetchOrderHistory() {
        orderHistoryTableView.reloadData()
    }
    @objc private func writeStoryButtonTapped() {
        let nextViewController = WriteStoryViewController()
        nextViewController.storeNameLabel.text = viewModel.model.value[0].cafeName
        nextViewController.navigationController?.setToolbarHidden(false, animated: true)
        nextViewController.navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    @objc func orderhis() {
        let vc = PayDetailViewController(viewmodel: viewModel)
        vc.bool = false
        let nextVC = UINavigationController(rootViewController: vc)
                nextVC.modalTransitionStyle = .coverVertical
                nextVC.modalPresentationStyle = .fullScreen
                self.present(nextVC, animated: true)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension OrderHistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.value.count
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let dequecell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        guard let cell = dequecell as? OrderHistoryTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.writeStoryButton.addTarget(self,
                                        action: #selector(writeStoryButtonTapped),
                                        for: .touchUpInside
        )
        cell.orderInfoButton.addTarget(self, action: #selector(orderhis), for: .touchUpInside)
        let model = viewModel.model.value[indexPath.row]
        cell.storeNameLabel.text = viewModel.model.value[indexPath.row].cafeName
        let timestamp = viewModel.model.value[indexPath.row].time
        let date = timestamp.dateValue()
        let formateer = DateFormatter()
        formateer.dateFormat = "yyyy년 MM월 dd일"
        cell.paymentDateLabel.text = formateer.string(from: date)
        cell.menuValueLabel.text = "\(model.menu1) \(model.menuCount1)개, \(model.menu2) \(model.menuCount2)개"
        cell.priceValueLabel.text = model.totalprice + "원"
        return cell
    }
}
