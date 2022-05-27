//
//  SearchCollectionViewController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/20.
//

import UIKit

class SearchCollectionViewController: UICollectionViewController {

    //MARK: - 프로퍼티
    private var 임시카운트 = 0
    private lazy var searchBar = UISearchBar(frame: CGRect(
        x: 0, y: 0, width: view.bounds.width - 28, height: 0))
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "검색결과없음이미지")
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    //MARK: - 라이프사이클
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNotification()
        setAtrribute()
        naviSetAttribute()
        setLayout()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeNotification()
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
    
    //MARK: - 셀렉터메서드
    
    @objc private func keyboardWillShow(_ sender: Notification) {
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            imageView.snp.updateConstraints { make in
                make.bottom.equalToSuperview().offset(-keyboardHeight)
            }
        }
    }
    @objc private func keyboardWillHide(_ sender: Notification) {
        imageView.snp.updateConstraints { make in
            make.bottom.equalToSuperview().offset(-120)
        }
    }
    
    
    //MARK: - 메서드
    
    private func setLayout() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.snp.topMargin)
            make.bottom.equalToSuperview().offset(-120)
        }
    }
    private func setAtrribute() {
        collectionView.register(SortCell.self, forCellWithReuseIdentifier: SortCell.identifier)
        
    }
    private func naviSetAttribute() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = ""
        tabBarController?.tabBar.isHidden = true
        searchBar.placeholder = "키워드로 검색하기"
        searchBar.setValue("취소", forKey: "cancelButtonText")
        searchBar.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchBar)
        navigationItem.hidesSearchBarWhenScrolling = false
        searchBar.becomeFirstResponder()
    }
    private func setNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    private func removeNotification() {
        NotificationCenter.default.removeObserver(self)
    }

    //MARK: - 컬렉션뷰 데이터소스

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        if 임시카운트 == 0 {
            imageView.isHidden = false
            return 임시카운트
        } else {
            imageView.isHidden = true
            return 임시카운트
        }
    }
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SortCell.identifier,
            for: indexPath
        )
        return cell
    }

}


//MARK: - 서치바 델리게이트
extension SearchCollectionViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        임시카운트 += 1
        searchBar.endEditing(true)
    }
}
