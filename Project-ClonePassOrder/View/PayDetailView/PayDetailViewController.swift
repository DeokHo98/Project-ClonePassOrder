//
//  PayDetailViewController.swift
//  Project-ClonePassOrder
//
//  Created by miori Lee on 2022/05/27.
//

import Foundation
import SnapKit

class PayDetailViewController : UIViewController {
    
    var bool = true
    let viewmodel: OrderViewModel
    let btnContainView = OrangeSelectButton()
    let myScrollView = UIScrollView()
    let payDtailInfoView = PayDetailInfoView()
    let receiptView = PayReceiptView()
    lazy var scrollStackView : UIStackView = {
        let sv = UIStackView()
        [payDtailInfoView,receiptView].forEach { sv.addArrangedSubview($0)}
        sv.axis = .vertical
        sv.spacing = 15
        sv.alignment = .fill
        sv.distribution = .fill
        sv.backgroundColor = .white
        return sv
    }()
    init(viewmodel: OrderViewModel) {
        self.viewmodel = viewmodel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttribute()
        setLayout()
    }
    private func setAttribute(){
        self.title = ""
        self.view.backgroundColor = .white
        myScrollView.alwaysBounceVertical = true
    }
    private func setLayout(){
        self.view.addSubview(myScrollView)
        myScrollView.addSubview(scrollStackView)
        self.view.addSubview(btnContainView)
        myScrollView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
        scrollStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(myScrollView)
        }
        btnContainView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.11)
        }
        btnContainView.getButton.setTitle("확인했어요!", for: .normal)

        btnContainView.getButton.addTarget(self, action: #selector(tochbutton), for: .touchUpInside)
        
        let model = viewmodel.model.value[0]
        let timestamp = model.time
        let date = timestamp.dateValue()
        let formateer = DateFormatter()
        formateer.dateFormat = "yyyy년 MM월 dd일"
        payDtailInfoView.orderInfo1.titleLabel.text = "주문"
        payDtailInfoView.orderInfo1.contentLabel.text = formateer.string(from: date)
        receiptView.itemlabel.titleLabel.text = model.menu1
        receiptView.itemlabel.contentLabel.text = model.menuCount1
        receiptView.itemlabel.contentLabel2.text = model.menu1price
        receiptView.itemlabe2.titleLabel.text = model.menu2
        receiptView.itemlabe2.contentLabel.text = model.menuCount2
        receiptView.itemlabe2.contentLabel2.text = model.menu2price
        
        receiptView.totalLabel.titleLabel.text = "합계"
        receiptView.totalLabel.contentLabel.text = model.totalprice
        receiptView.payTotalLabel.titleLabel.text = "결제금액"
        receiptView.payTotalLabel.contentLabel.text = model.totalprice
    }
    
    @objc func tochbutton() {
        if bool {
                let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
                guard let delegate = sceneDelegate else {
                    return
                }
                let vc = TabBarController()
                delegate.window?.rootViewController = vc
        } else {
                self.dismiss(animated: true, completion: nil)
            }
    }
    }

