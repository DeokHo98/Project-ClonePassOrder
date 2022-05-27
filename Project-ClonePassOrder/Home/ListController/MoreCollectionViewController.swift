//
//  MoreCollectionViewController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/19.
//

import UIKit

class MoreCollectionViewController: UICollectionViewController {
    
    //MARK: - 프로퍼티
    
    var naviTitle: String?

    //MARK: - 라이프사이클

    override func viewDidLoad() {
        super.viewDidLoad()
        naviSetAttribute()
        setAtrribute()
    }
    init() {
        let layout = UICollectionViewCompositionalLayout { section, env in
            return NSCollectionLayoutSection.sortLayout()
        }
        super.init(collectionViewLayout: layout)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 메서드
    
    private func setAtrribute() {
        self.collectionView!.register(SortCell.self, forCellWithReuseIdentifier: SortCell.identifier)
    }
    private func naviSetAttribute() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = ""
        navigationItem.title = naviTitle
        navigationController?.navigationBar.tintColor = .black
        tabBarController?.tabBar.isHidden = true
    }

    //MARK: - 컬렉션뷰 데이터소스
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SortCell.identifier,
            for: indexPath
        ) as! SortCell
        return cell
    }
}
