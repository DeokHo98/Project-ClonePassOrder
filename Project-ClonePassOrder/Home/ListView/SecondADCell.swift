//
//  SecondADCell.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/19.
//

import SnapKit
import UIKit

class SecondADCell: UICollectionViewCell {
    
    //MARK: - 식별자
    
    static let identifier: String = "SecondADCell"
    
    //MARK: - 프로퍼티
    
    private var currentPage: Int = 0
    private var image = [UIImage(systemName: "heart")!,UIImage(systemName: "star.fill")!,UIImage(named: "패스오더로그인이미지")!,UIImage(systemName: "star.fill")!,UIImage(named: "패스오더로그인이미지")!]
    private var ADUrl = ["첫번째 링크","두번째링크","세번째링크","네번째링크","다섯번째링크"]
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.isPagingEnabled = true
        sv.showsHorizontalScrollIndicator = false
        let gesutre = UITapGestureRecognizer(target: self, action: #selector(scrollViewTapped))
        sv.addGestureRecognizer(gesutre)
        sv.delegate = self
        return sv
    }()
    let countLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.alpha = 0.6
        lb.backgroundColor = .darkGray
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 14)
        lb.clipsToBounds = true
        lb.layer.cornerRadius = 32 / 3
        return lb
    }()
    
    //MARK: - 라이프사이클
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setAtrribute()
        addContentScrollView()
        ADTimer(time: 3)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 셀렉터 메서드
    
    @objc func scrollViewTapped() {
        let currentImageCount = Int(currentPage / Int(self.bounds.width))
        print(ADUrl[currentImageCount])
    }
    
    //MARK: - 메서드
    
    private func setLayout() {
        [scrollView,countLabel].forEach {
            self.addSubview($0)
        }
        scrollView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        countLabel.snp.makeConstraints { make in
            make.width.equalTo(35)
            make.height.equalTo(22)
            make.trailing.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    private func setAtrribute() {
        countLabel.text = "\(1)/\(image.count)"
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
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 10
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
            if self?.currentPage == Int(width * CGFloat(count - 1)) {
                self?.currentPage = 0
                UIView.animate(withDuration: 0.2) {
                    self?.scrollView.contentOffset.x = 0
                }
            } else {
                self?.currentPage += Int(width)
                UIView.animate(withDuration: 0.2) {
                    self?.scrollView.contentOffset.x += CGFloat(width)
                }
            }
        }
    }
}

//MARK: - 스크롤뷰 델리게이트

extension SecondADCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageText = Int(scrollView.contentOffset.x/self.bounds.width)
        currentPage = pageText * Int(self.bounds.width)
        countLabel.text = "\(pageText + 1)/\(image.count)"
    }
}

