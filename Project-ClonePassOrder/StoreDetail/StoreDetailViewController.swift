//
//  StoreDetailViewController.swift
//  Project-ClonePassOrder
//
//  Created by Eunsoo KIM on 2022/05/16.
//

import UIKit
import SnapKit

final class StoreDetailViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private let floatingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private let floatingButton: UIButton = {
        let button = UIButton()
        button.setTitle("가져 갈게요\n메뉴 보기", for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = #colorLiteral(red: 1, green: 0.4730066061, blue: 0.2864735723, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()
    private let storeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
    }()
    private let storeInfoView: UIView = {
        let view = UIView()
        return view
    }()
    private let storeName: UILabel = {
        let label = UILabel()
        label.text = "빽따방!"
        label.font = .preferredFont(forTextStyle: .title2)
        return label
    }()
    private let storeDescription: UILabel = {
        let label = UILabel()
        label.text = """
                        백종원이 하는 백다방!
                        커피가 맛있어요👍🏻
                        """
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()

    // MARK: - viewLifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    private func makeUI() {
        view.backgroundColor = .tertiarySystemGroupedBackground
        
        view.addSubview(scrollView)
        view.addSubview(floatingView)
        
        floatingView.addSubview(floatingButton)
        
        scrollView.addSubview(storeImageView)
        scrollView.addSubview(storeInfoView)
        
        storeInfoView.addSubview(storeName)
        storeInfoView.addSubview(storeDescription)
        
        setAutolayout()
    }
    
    private func setAutolayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        floatingView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(100)
        }
        floatingButton.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(20)
        }
        storeImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(scrollView.snp.top)
            $0.height.equalTo(600)
            $0.width.equalToSuperview()
        }
        storeInfoView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(storeImageView.snp.bottom).offset(20)
            $0.bottom.equalTo(scrollView.snp.bottom).inset(10)
        }
        storeName.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview().inset(10)
        }
        storeDescription.snp.makeConstraints {
            $0.top.equalTo(storeName.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }
}
