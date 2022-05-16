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
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private let storeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        return imageView
    }()
    private let storeInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    private let storeName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "빽따방!"
        label.font = .preferredFont(forTextStyle: .title2)
        return label
    }()
    private let storeDescription: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = """
                        안녕하세요!
                        빽다방입니다.
                        """
        textView.textColor = .lightGray
        textView.backgroundColor = .clear
        textView.font = .preferredFont(forTextStyle: .body)
        return textView
    }()
    
    
    // MARK: - viewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    private func makeUI() {
        view.backgroundColor = .tertiarySystemGroupedBackground
        
        view.addSubview(scrollView)
        
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
        storeImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(600)
            $0.width.equalToSuperview()
        }
        storeInfoView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(storeImageView.snp.bottom).offset(20)
            $0.bottom.equalTo(storeDescription.snp.bottom).inset(20)
            
        }
        storeName.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview().inset(10)
        }
        storeDescription.snp.makeConstraints {
            $0.top.equalTo(storeName).offset(20)
            $0.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }
    
    
}
