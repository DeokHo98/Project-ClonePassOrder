//
//  IceSelectCell.swift
//  Project-ClonePassOrder
//
//  Created by miori Lee on 2022/05/24.
//

import Foundation
import SnapKit
import UIKit

protocol OptionCellDelegate : AnyObject {
    func optionTapped(_ sender : UIButton)
}

class IceSelectCell : UITableViewCell {
    
    static let registerID = "\(IceSelectCell.self)"
    
    let moneyCircleBtn = MoneyCircleButton()
    var delegate : OptionCellDelegate?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setAttribute()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setAttribute(){
        contentView.isUserInteractionEnabled = true
        moneyCircleBtn.addTarget(self, action: #selector(moneyCircleBtnTapped(_:)), for: .touchUpInside)
    }
    private func setLayout(){
    }
    @objc func moneyCircleBtnTapped(_ sender: UIButton) {
        delegate?.optionTapped(sender)
    }
}
