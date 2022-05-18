//
//  File.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/17.
//

import UIKit

class ListController: UICollectionViewController {
    
    //MARK: - 프로퍼티
    
    
    //MARK: - 라이프사이클
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - 메서드
    

    //MARK: - 컬렉션뷰 데이터소스
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}
