//
//  StoreDetailStoryView.swift
//  Project-ClonePassOrder
//
//  Created by Eunsoo KIM on 2022/05/17.
//

import UIKit

class StoreDetailStoryView: UIView {
    
    let storyView: UICollectionView = {
        let collectionView = UICollectionView()
        
        return collectionView
    }()
    
    // MARK: - initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - setAtrribute
    
    private func setAtrribute() {
    }
    
    // MARK: - setLayout
    
    private func setLayout() {
        self.backgroundColor = .systemGroupedBackground
    }
}

extension StoreDetailStoryView: UICollectionViewDelegate {
    
}
