//
//  FistADCell.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/18.
//

import SnapKit
import UIKit

class FirstADCell: UICollectionViewCell {
    
    //MARK: - 식별자
    
    static let identifier: String = "FirstADCell"
    
    //MARK: - 프로퍼티
    
    private var currentPage: CGFloat = 0
    private var image = [UIImage(systemName: "heart")!,UIImage(systemName: "star.fill")!,UIImage(named: "패스오더로그인이미지")!,UIImage(systemName: "star.fill")!,UIImage(named: "패스오더로그인이미지")!]
    private var ADUrl = ["첫번째 링크","두번째링크","세번째링크","네번째링크","다섯번째링크"]
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.isPagingEnabled = true
        sv.isScrollEnabled = false
        let gesutre = UITapGestureRecognizer(target: self, action: #selector(scrollViewTapped))
        sv.addGestureRecognizer(gesutre)
        return sv
    }()
    
    //MARK: - 라이프사이클
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        addContentScrollView()
        ADTimer(time: 5)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 셀렉터 메서드
    
    @objc func scrollViewTapped() {
        let currentImageCount = Int(currentPage / self.bounds.width)
        print(ADUrl[currentImageCount])
    }
    
    //MARK: - 메서드
    
    private func setLayout() {
        self.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    private func addContentScrollView() {
        for i in 0..<image.count {
            let imageView: UIImageView = UIImageView(frame: self.frame)
            let xPos = self.frame.width * CGFloat(i)
            imageView.frame = CGRect(
                x: xPos,
                y: 0,
                width: self.bounds.width,
                height: self.bounds.height
            )
            imageView.image = image[i]
            scrollView.addSubview(imageView)
            scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
        }
    }
    private func ADTimer(time: TimeInterval) {
        let _ = Timer.scheduledTimer(withTimeInterval: time, repeats: true) { [weak self] timer in
            guard let width = self?.bounds.width else {
                return
            }
            guard let count = self?.image.count else {
                return
            }
            if self?.currentPage == width * CGFloat(count - 1) {
                self?.currentPage = 0
                self?.scrollView.contentOffset.x = 0
            } else {
                self?.currentPage += width
                self?.scrollView.contentOffset.x += width
            }
        }
    }
}
