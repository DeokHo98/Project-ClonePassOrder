//
//  ThreeLabelView.swift
//  Project-ClonePassOrder
//
//  Created by miori Lee on 2022/05/27.
//

import SnapKit
import UIKit

class ThreeLabelView : UIView {
    var color : UIColor?
    var strSize : CGFloat?
    
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    let contentLabel2 = UILabel()
    init(str1: String, str2: String, str3: String, color: UIColor, strSize : CGFloat) {
        self.color = color
        self.strSize = strSize
        super.init(frame:  CGRect(x: 0, y: 0, width: 0, height: 0))
        setAttribute()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setAttribute(){
        self.backgroundColor = .white
        [titleLabel,contentLabel,contentLabel2].forEach {
            $0.textColor = color
            $0.font = .systemFont(ofSize: strSize!, weight: .medium)
        }
    }
    private func setLayout(){
        [titleLabel,contentLabel,contentLabel2].forEach { self.addSubview($0)}
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
            make.topMargin.equalTo(3)
        }
        contentLabel.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.centerX.equalToSuperview().offset(30)
        }
        contentLabel2.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalToSuperview().inset(12)
        }
    }
}
