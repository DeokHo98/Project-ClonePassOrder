//
//  StoryCollectionViewCell.swift
//  Project-ClonePassOrder
//
//  Created by Eunsoo KIM on 2022/05/17.
//

import UIKit
import SnapKit

class StoryCollectionViewCell: UICollectionViewCell {
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.backgroundColor = .gray
        return imageView
    }()
    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title2)
        label.text = "프로필명"
        return label
    }()
    let createdDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray5
        label.text = "4일 전"
        return label
    }()
    lazy var nameDateStackView: UIStackView = {
        let stackView = UIStackView()
        [profileNameLabel, createdDateLabel].forEach { stackView.addArrangedSubview($0) }
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    lazy var profileStackView: UIStackView = {
        let stackView = UIStackView()
        [profileImageView, nameDateStackView].forEach{ stackView.addArrangedSubview($0) }
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        return button
    }()
    lazy var userStackView: UIStackView = {
        let stackView = UIStackView()
        [profileStackView, moreButton].forEach{ stackView.addArrangedSubview($0) }
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    let storyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray5
        label.numberOfLines = 0
        label.text = """
                     너무 맛있구여
                     친절 하시구여
                     다음에 또 올거구여
                     """
        return label
    }()
    let storyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.backgroundColor = .gray
        return imageView
    }()
    let likeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("좋아요 0개", for: .normal)
        return button
    }()
    let commentsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("댓글 0개", for: .normal)
        return button
    }()
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        [likeButton, commentsButton].forEach{ stackView.addArrangedSubview($0) }
        stackView.axis = .horizontal
        
        return stackView
    }()
    let seperator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()

    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - setAtrribute
    func setAtrribute(
        profileImage: UIImage?,
        profileName: String,
        createdDate: String,
        story: String,
        storyImage: UIImage?
    ) {
        profileImageView.image = profileImage
        profileNameLabel.text = profileName
        createdDateLabel.text = createdDate
        storyLabel.text = story
        storyImageView.image = storyImage
    }
    
    // MARK: - setLayout
    
    func setLayout() {
        contentView.addSubview(userStackView)
        contentView.addSubview(storyLabel)
        contentView.addSubview(storyImageView)
        contentView.addSubview(buttonStackView)
        contentView.addSubview(seperator)
        
        
        userStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(10)
        }
        storyLabel.snp.makeConstraints { make in
            make.top.equalTo(userStackView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        storyImageView.snp.makeConstraints { make in
            make.top.equalTo(storyLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(300)
        }
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(storyImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(80)
        }
        seperator.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(1)
        }
    }
    
    @objc func moreButtonTapped() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "신고", style: .default))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        
    }
}
