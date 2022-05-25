//
//  ReOrderViewController.swift
//  Project-ClonePassOrder
//
//  Created by Eunsoo KIM on 2022/05/24.
//

import UIKit
import SnapKit

class ReorderViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let reorderInfomationLabel: UILabel = {
        let label = UILabel()
        label.text = "간편하게 재주문하세요"
        label.backgroundColor = .darkGray
        label.textColor = .white
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 25
        return label
    }()
    let receiptView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -1)
        view.layer.shadowOpacity = 0.5
        return view
    }()
    let storeNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.text = "빽따방 부천점"
        return label
    }()
    let currentOrderDateLabel: UILabel = {
        let label = UILabel()
        label.text = "2022.05.12 15:03"
        label.textColor = .systemGray3
        return label
    }()
    let seperator1: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    let menuTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "메뉴"
        label.textColor = .orange
        return label
    }()
    let reorderMenuTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    let seperator2: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    let expectationReceiveLabel: UILabel = {
        let label = UILabel()
        label.text = "예상수령시간"
        label.textColor = .orange
        return label
    }()
    let selecteExpectation: UIButton = {
        let button = UIButton()
        button.setTitle("15분 ▼", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    let requestsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "요청사항"
        label.textColor = .orange
        return label
    }()
    let requestsTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "ex) 아메리카노 하나는 연하게 주세요."
        textField.clearButtonMode = .always
        textField.borderStyle = .none
        return textField
    }()
    let textFieldLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    let paymentMethodTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "결제수단"
        label.textColor = .orange
        return label
    }()
    let selectePaymentMethod: UIButton = {
        let button = UIButton()
        button.setTitle("카카오페이 ▼", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "결제금액"
        label.textColor = .orange
        return label
    }()
    let priceValueLabel: UILabel = {
        let label = UILabel()
        label.text = "5,600원"
        label.textColor = .orange
        return label
    }()
    let usePointButton: UIButton = {
        let button = UIButton()
        button.setTitle("포인트사용", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray3
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 10
        return button
    }()
    let paymentButton: UIButton = {
        let button = UIButton()
        button.setTitle("결제", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 10
        button.backgroundColor = .darkGray
        return button
    }()
    lazy var expectationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [expectationReceiveLabel, selecteExpectation])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    lazy var paymentMethodStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [paymentMethodTitleLabel, selectePaymentMethod])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    lazy var priceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [priceTitleLabel, priceValueLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    lazy var paymentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usePointButton, paymentButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    
    // MARK: - setLayout
    
    private func setLayout() {
        view.backgroundColor = .white
        
        view.addSubview(reorderInfomationLabel)
        view.addSubview(receiptView)
        view.bringSubviewToFront(reorderInfomationLabel)
        receiptView.addSubview(storeNameLabel)
        receiptView.addSubview(currentOrderDateLabel)
        receiptView.addSubview(seperator1)
        receiptView.addSubview(menuTitleLabel)
        receiptView.addSubview(reorderMenuTableView)
        receiptView.addSubview(seperator2)
        receiptView.addSubview(expectationStackView)
        receiptView.addSubview(requestsTitleLabel)
        receiptView.addSubview(requestsTextField)
        receiptView.addSubview(textFieldLineView)
        receiptView.addSubview(paymentMethodStackView)
        receiptView.addSubview(priceStackView)
        receiptView.addSubview(paymentStackView)
        
        reorderInfomationLabel.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width / 2)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        receiptView.snp.makeConstraints { make in
            make.top.equalTo(reorderInfomationLabel.snp.centerY)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
        storeNameLabel.snp.makeConstraints { make in
            make.top.equalTo(reorderInfomationLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        currentOrderDateLabel.snp.makeConstraints { make in
            make.top.equalTo(storeNameLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        seperator1.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(currentOrderDateLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        menuTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(seperator1).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        reorderMenuTableView.snp.makeConstraints { make in
            make.top.equalTo(menuTitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(200)
        }
        seperator2.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(reorderMenuTableView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        expectationStackView.snp.makeConstraints { make in
            make.top.equalTo(seperator2.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        requestsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(expectationStackView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        requestsTextField.snp.makeConstraints { make in
            make.top.equalTo(requestsTitleLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        textFieldLineView.snp.makeConstraints { make in
            make.top.equalTo(requestsTextField.snp.bottom)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        paymentMethodStackView.snp.makeConstraints { make in
            make.top.equalTo(textFieldLineView).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        priceStackView.snp.makeConstraints { make in
            make.top.equalTo(paymentMethodStackView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        paymentStackView.snp.makeConstraints { make in
            make.top.equalTo(priceStackView.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        guard let text = priceValueLabel.text else {
            return
        }
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.addAttribute(.foregroundColor, value: UIColor.black, range: (text as NSString).range(of: "원"))
        self.priceValueLabel.attributedText = attributeString
    }
    
    fileprivate func setNavigation() {
        title = "재주문"
        let backButton = UIBarButtonItem()
        backButton.title = "X"
        backButton.tintColor = .black
        
        backButton.target = self
        backButton.action = #selector(back)
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func back() {
        dismiss(animated: true)
    }
}
