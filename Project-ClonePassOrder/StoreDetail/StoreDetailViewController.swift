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
    
    let labelOne: UILabel = {
      let label = UILabel()
      label.text = "Scroll Top"
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let labelTwo: UILabel = {
      let label = UILabel()
      label.text = "Scroll Bottom"
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
//    private let storeImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.backgroundColor = .gray
//        return imageView
//    }()
//    private let storeInfoView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .yellow
//        return view
//    }()
//    private let storeName: UILabel = {
//        let label = UILabel()
//        label.text = "빽따방!"
//        label.font = .preferredFont(forTextStyle: .title2)
//        return label
//    }()
//    private let storeDescription: UITextView = {
//        let textView = UITextView()
//        textView.text = """
//                        안녕하세요!
//                        빽다방입니다.
//                        ㅇㅇ
//                        ㅇㄸ
//                        ㅇ3ㄷ
//                        ㅎㄷㄱㅎㄷ
//
//                        ㄷㄱㅎㄷㄱ
//                        ㅎ
//                        ㄷㄱㅎ
//                        ㄷㄱㅎㄷㄱ
//                        """
//        textView.textColor = .lightGray
//        textView.backgroundColor = .clear
//        textView.isEditable = false
//        textView.isSelectable = false
//        textView.isScrollEnabled = false
//        textView.font = .preferredFont(forTextStyle: .body)
//        return textView
//    }()
    
    
    // MARK: - viewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    private func makeUI() {
        view.backgroundColor = .tertiarySystemGroupedBackground
        
        view.addSubview(scrollView)
        
//        scrollView.addSubview(storeImageView)
//        scrollView.addSubview(storeInfoView)
//
//        storeInfoView.addSubview(storeName)
//        storeInfoView.addSubview(storeDescription)
        
        
        setAutolayout()
    }
    
    private func setAutolayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        scrollView.addSubview(labelOne)

        labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true

        scrollView.addSubview(labelTwo)

        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1000).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
//        storeImageView.snp.makeConstraints {
//            $0.leading.equalToSuperview()
//            $0.trailing.equalToSuperview()
//            $0.top.equalToSuperview()
//            $0.height.equalTo(600)
//            $0.width.equalToSuperview()
//        }
//        storeInfoView.snp.makeConstraints {
//            $0.leading.trailing.equalToSuperview().inset(20)
//            $0.top.equalTo(storeImageView.snp.bottom).offset(20)
//            $0.height.equalTo(600)
//        }
//        storeName.snp.makeConstraints {
//            $0.leading.trailing.top.equalToSuperview().inset(10)
//        }
//        storeDescription.snp.makeConstraints {
//            $0.top.equalTo(storeName.snp.bottom).offset(10)
//            $0.leading.trailing.bottom.equalToSuperview().inset(10)
//        }
    }
    
    
}
