//
//  ListExtenstion.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/19.
//

import UIKit

extension UILabel {
    func listLabel(text: String, color: UIColor, font: UIFont) -> UILabel {
        let lb = UILabel()
        lb.text = " \(text)"
        lb.font = font
        lb.numberOfLines = 0
        lb.textColor = color
        return lb
    }
}

extension UIImageView {
    func listImageView(imageName: String, color: UIColor) -> UIImageView {
        let iv = UIImageView()
        iv.image = UIImage(systemName: imageName)
        iv.tintColor = color
        return iv
    }
}

extension UICollectionViewCell {
    func listCellSetLayout(
        imageView: UIView,
        nameLabel: UIView,
        timeImage: UIView,
        timeStackView: UIView,
        distanceImage: UIView,
        distanceStackView: UIView,
        likeImage: UIView,
        likeStackView: UIView,
        storyImage: UIView,
        storyStackView: UIView
    ) {
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(7)
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
