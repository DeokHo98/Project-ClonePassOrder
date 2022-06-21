//
//  OrderPayViewController.swift
//  Project-ClonePassOrder
//
//  Created by miori Lee on 2022/05/25.
//

import Foundation
import SnapKit
import UIKit
import Firebase
import SVProgressHUD
import SwiftUI

class OrderPayViewController : UIViewController, payinfoviewDelegate {
    let orderviewmodel = OrderViewModel()
    var time = Timestamp(date: Date())
    var state: Int = 0
    func plus() {
        totalPrice += 메뉴개인값[0]
        count[0] += 1
        menuPrice[0] += 메뉴개인값[0]
    }
    
    func minus() {
        if count[0] > 1 {
            totalPrice -= 메뉴개인값[0]
            count[0] -= 1
            menuPrice[0] -= 메뉴개인값[0]
        }
    }
    
    var menu: [String] = []
    var menuPrice: [Int] = [] {
        didSet {
            var string2 = String(menuPrice[0])
            if menuPrice[0] >= 10000 {
                string2.insert(",", at: string2.index(string2.startIndex, offsetBy: 2))
            } else {
                string2.insert(",", at: string2.index(string2.startIndex, offsetBy: 1))
            }
            payInfoView.payInfoView.priceLabel.text = string2
        }
    }
    var 메뉴개인값: [Int] = []
    var totalPrice = 0 {
        didSet {
            var string2 = String(totalPrice)
            if totalPrice >= 10000 {
                string2.insert(",", at: string2.index(string2.startIndex, offsetBy: 2))
            } else {
                string2.insert(",", at: string2.index(string2.startIndex, offsetBy: 1))
            }
            payBtn.getButton.setTitle("\(string2)원    결제하기", for: .normal)
            totalOrderView.wonLabel.text = string2 + "원"
        }
    }
    var count: [Int] = [] {
        didSet {
            payInfoView.payInfoView.quantityView.quantityLabel.text = "\(count[0])"
        }
    }
    let myScrollView = UIScrollView()
    let locationView = LocationView()
    let payInfoView = PayInfoView()
    
    let requirementView = RequirementView()
    let totalOrderView = TotalOrderView()
    var isFirst : Bool = false
    let cellSize = CGSize(width: ScreenConstant.deviceWidth * 0.45, height: ScreenConstant.deviceWidth * 0.45 * 0.66)
    var previousIndex = 0
    lazy var scrollStackView: UIStackView = {
        let sv = UIStackView()
        [locationView, payInfoView, requirementView, totalOrderView].forEach { sv.addArrangedSubview($0) }
        sv.axis = .vertical
        sv.spacing = 15
        sv.alignment = .fill
        sv.distribution = .fill
        sv.backgroundColor = .systemGray3
        return sv
    }()
    let payBtn = OrangeSelectButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        payInfoView.delegate = self
        self.dismissKeyboardWhenTappedAround()
        setAttribute()
        setLayout()
        setLeftBarButtonItem()
        setCollectionView()
        isFirst = true
        payBtn.getButton.addTarget(self, action: #selector(payBtnTapped), for: .touchUpInside)
        navigationController?.navigationBar.topItem?.title = ""
        var string = String(totalPrice)
        if totalPrice >= 10000 {
            string.insert(",", at: string.index(string.startIndex, offsetBy: 2))
        } else {
            string.insert(",", at: string.index(string.startIndex, offsetBy: 1))
        }
        totalOrderView.wonLabel.text = string + "원"
        var string2 = String(menuPrice[0])
        if menuPrice[0] >= 10000 {
            string2.insert(",", at: string2.index(string2.startIndex, offsetBy: 2))
        } else {
            string2.insert(",", at: string2.index(string2.startIndex, offsetBy: 1))
        }
        payInfoView.payInfoView.itemNameLabel.text = menu[0]
        payInfoView.payInfoView.priceLabel.text = string2
        payInfoView.payInfoView.quantityView.quantityLabel.text = "\(count[0])"
        var string3 = String(menuPrice[1])
        if menuPrice[1] >= 10000 {
            string3.insert(",", at: string3.index(string3.startIndex, offsetBy: 2))
        } else {
            string3.insert(",", at: string3.index(string3.startIndex, offsetBy: 1))
        }
        payInfoView.payInfoView2.itemNameLabel.text = menu[1]
        payInfoView.payInfoView2.priceLabel.text = string3
        payInfoView.payInfoView2.quantityView.quantityLabel.text = "\(count[1])"
     
    }
}
extension OrderPayViewController {
    private func setAttribute(){
        view.backgroundColor = .white
        self.title = "빽다방 동두천지행점"
        requirementView.requirementTF.delegate = self
    }
    private func setLayout(){
        [myScrollView,payBtn].forEach { self.view.addSubview($0)}
        [scrollStackView].forEach { myScrollView.addSubview($0) }
        myScrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(payBtn.snp.top)
        }
        payBtn.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.11)
        }
        scrollStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(myScrollView)
        }
    }
    private func setLeftBarButtonItem(){
        let leftBarButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(backButtonTapped))
        leftBarButton.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButton
    }
    @objc func backButtonTapped(){
        self.dismiss(animated: true)
    }
    private func setCollectionView(){
    }
}
extension OrderPayViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
extension OrderPayViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.registerID, for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        if indexPath.row == 0 && isFirst {
            isFirst = false
        } else {
            cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        return cell
    }
}
extension OrderPayViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return cellSize
    }
}
extension OrderPayViewController : UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
    private func animateZoomforCell(zoomCell: UICollectionViewCell, idxrow : Int) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {zoomCell.transform = .identity}, completion: nil)
        
    }
    private func animateZoomforCellremove(removeCell: UICollectionViewCell) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {removeCell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)}, completion: nil)
    }
}
extension OrderPayViewController {
    @objc private func payBtnTapped(){
        let user = Auth.auth().currentUser?.uid
        let timesttamp = Timestamp(date: Date())
        Firestore.firestore().collection("cafe").document("빽다방 동두천지행점").collection("order").document(user ?? "").setData([
            "state": 0,
            "name" : UserViewModel.shared.userName,
            "cafeName": "빽다방 동두천지행점",
            "menu1": "\(menu[0])",
            "menu2": "\(menu[1])",
            "menu1count": "\(count[0])",
            "menu2count": "\(count[1])",
            "menu1Price": "\(menuPrice[0])",
            "menu2Price": "\(menuPrice[1])",
            "request": requirementView.requirementTF.text ?? "",
            "totalPrice": "\(totalPrice)",
            "time": timesttamp
        ])
        Firestore.firestore().collection("user").document(user ?? "").collection("order").addDocument(data: [
            "cafeName": "빽다방 동두천지행점",
            "menu1": "\(menu[0])",
            "menu2": "\(menu[1])",
            "menu1count": "\(count[0])",
            "menu2count": "\(count[1])",
            "menu1Price": "\(menuPrice[0])",
            "menu2Price": "\(menuPrice[1])",
            "request": requirementView.requirementTF.text ?? "",
            "totalPrice": "\(totalPrice)",
            "time": timesttamp
        ])
        self.time = timesttamp
        
        SVProgressHUD.SVshow(view: view, text: "매장에서 확인중이에요!", button: [])
        self.orderviewmodel.fetch()
        
        Firestore.firestore().collection("cafe").document("빽다방 동두천지행점").collection("order").document(Auth.auth().currentUser?.uid ?? "").addSnapshotListener { snapshot, error in
            guard let snapshot = snapshot?.data() else { return }
            let num = snapshot["state"] as? Int ?? 0
            if num == 1 {
                SVProgressHUD.SVoff(view: self.view, button: [])
                let nextVC = UINavigationController(rootViewController: PayDetailViewController(viewmodel: self.orderviewmodel))
                        nextVC.modalTransitionStyle = .coverVertical
                        nextVC.modalPresentationStyle = .fullScreen
                        self.present(nextVC, animated: true)
            }
        }
    }
}



