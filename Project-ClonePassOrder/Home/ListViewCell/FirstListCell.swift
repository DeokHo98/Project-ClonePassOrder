//
//  FirstListCell.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/19.
//

import SnapKit
import UIKit

class FirstListCell: UICollectionViewCell {
    
    //MARK: - 식별자
    
    static let identifier = "FirstListCell"
    
    //MARK: - 프로퍼티
    
   private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .lightGray
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()
   private let nameLabel: UILabel = UILabel().listLabel(
        text: "메가커피 양주점",
        color: .black,
        font: .boldSystemFont(ofSize: 18)
   )
   private let timeLabel: UILabel = UILabel().listLabel(
        text: "10분후 수령가능",
        color: .systemOrange,
        font: .boldSystemFont(ofSize: 16)
   )
    private let timeImage: UIImageView = UIImageView().listImageView(
        imageName: "timer",
        color: .systemOrange
    )
    private let distanceLabel: UILabel = UILabel().listLabel(
        text: "4.6km",
        color: .lightGray,
        font: .boldSystemFont(ofSize: 16)
    )
    private let distanceImage: UIImageView = UIImageView().listImageView(
        imageName: "location.north.fill",
        color: .lightGray
    )
    private let likeImage: UIImageView = UIImageView().listImageView(
        imageName: "heart.fill",
        color: .systemRed
    )
    private let likeLabel: UILabel = UILabel().listLabel(
        text: "0",
        color: .systemRed,
        font: .systemFont(ofSize: 16)
    )
    private let storyImage: UIImageView = UIImageView().listImageView(
        imageName: "bubble.right.fill",
        color: .white
    )
    private let storyLabel: UILabel = UILabel().listLabel(
        text: "0",
        color: .white,
        font: .systemFont(ofSize: 16)
    )
    private lazy var timeStackView: UIStackView = UIStackView(
        arrangedSubviews: [timeImage,timeLabel]
    )
    private lazy var distanceStackView: UIStackView = UIStackView(
        arrangedSubviews: [distanceImage,distanceLabel]
    )
    private lazy var likeStackView: UIStackView = UIStackView(
        arrangedSubviews: [likeImage,likeLabel]
    )
    private lazy var storyStackView: UIStackView = UIStackView(
        arrangedSubviews: [storyImage,storyLabel]
    )
    
    //MARK: - 라이프사이클
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 메서드
    
    private func setLayout() {
        [imageView,
         nameLabel,
         timeStackView,
         distanceStackView,
         likeStackView,
         storyStackView].forEach {
            self.addSubview($0)
        }
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
        timeImage.snp.makeConstraints { make in
            make.width.height.equalTo(16)
        }
        timeStackView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
        }
        distanceImage.snp.makeConstraints { make in
            make.width.height.equalTo(16)
        }
        distanceStackView.snp.makeConstraints { make in
            make.top.equalTo(timeStackView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
        }
        likeImage.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
        likeStackView.snp.makeConstraints { make in
            make.leading.bottom.equalTo(imageView).inset(10)
        }
        storyImage.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
        storyStackView.snp.makeConstraints { make in
            make.leading.equalTo(likeStackView.snp.trailing).offset(3)
            make.centerY.equalTo(likeStackView)
        }
    }
}