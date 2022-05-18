//
//  HomeViewController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/13.
//

import SnapKit
import UIKit

enum HomeState {
    case listView
    case mapView
}

class HomeController: UIViewController {
    
    //MARK: - 프로퍼티
    private var homeState: HomeState = .listView
    private let searchButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.tintColor = .black
        bt.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        bt.setTitle("  매장 검색", for: .normal)
        bt.setTitleColor(.lightGray, for: .normal)
        bt.titleLabel?.font = .systemFont(ofSize: 18)
        return bt
    }()
    private let listButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("리스트로 주문", for: .normal)
        bt.titleLabel?.tintColor = .black
        bt.titleLabel?.font = .boldSystemFont(ofSize: 18)
        bt.addTarget(self, action: #selector(listButtonTapped), for: .touchUpInside)
        return bt
    }()
    private let mapButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.tintColor = .lightGray
        bt.setImage(UIImage(systemName: "map"), for: .normal)
        bt.setTitle(" 지도로 주문", for: .normal)
        bt.titleLabel?.tintColor = .lightGray
        bt.titleLabel?.font = .boldSystemFont(ofSize: 18)
        bt.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
        return bt
    }()
    private let stateButtonSeparateView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    private lazy var buttonStack: UIStackView = {
        let st = UIStackView(arrangedSubviews: [listButton,mapButton])
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.spacing = 60
        return st
    }()
    private let mapView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    private let listView: ListController = ListController()

    
    //MARK: - 라이프사이클
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviSetAttribute()
        setAtrribute()
        setLayout()
        stateButtonTapped()
    }
    
    //MARK: - 셀렉터메서드
    
    @objc private func listButtonTapped() {
        homeState = .listView
        stateButtonTapped()
    }
    @objc private func mapButtonTapped() {
        homeState = .mapView
        stateButtonTapped()
    }
    
    //MARK: - 메서드
    private func setLayout() {
        view.addSubview(searchButton)
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        view.addSubview(buttonStack)
        buttonStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(searchButton.snp.bottom).offset(20)
        }
        view.addSubview(stateButtonSeparateView)
        stateButtonSeparateView.snp.makeConstraints { make in
            make.height.equalTo(3)
            make.top.equalTo(listButton.snp.bottom)
            make.leading.equalTo(listButton.snp.leading)
            make.trailing.equalTo(listButton.snp.trailing)
        }
    }
    private func setAtrribute() {
        view.backgroundColor = .systemBackground
    }
    private func naviSetAttribute() {
        navigationController?.navigationBar.isHidden = true
    }
    private func stateButtonTapped() {
        switch homeState {
        case .listView:
            listButton.titleLabel?.tintColor = .black
            mapButton.tintColor = .lightGray
            mapButton.titleLabel?.tintColor = .lightGray
            stateButtonSeparateView.snp.remakeConstraints { make in
                make.height.equalTo(3)
                make.top.equalTo(listButton.snp.bottom)
                make.leading.equalTo(listButton.snp.leading)
                make.trailing.equalTo(listButton.snp.trailing)
            }
            mapView.removeFromSuperview()
            addChild(listView)
            view.addSubview(listView.view)
            listView.view.snp.makeConstraints { make in
                make.trailing.leading.equalToSuperview()
                make.top.equalTo(stateButtonSeparateView.snp.top).offset(10)
                make.bottom.equalTo(view.snp.bottomMargin)
            }
        case .mapView:
            listButton.titleLabel?.tintColor = .lightGray
            mapButton.tintColor = .black
            mapButton.titleLabel?.tintColor = .black
            stateButtonSeparateView.snp.remakeConstraints { make in
                make.height.equalTo(3)
                make.top.equalTo(mapButton.snp.bottom)
                make.leading.equalTo(mapButton.snp.leading)
                make.trailing.equalTo(mapButton.snp.trailing)
            }
            willMove(toParent: listView)
            listView.view.removeFromSuperview()
            view.addSubview(mapView)
            mapView.snp.makeConstraints { make in
                make.trailing.leading.equalToSuperview()
                make.top.equalTo(stateButtonSeparateView.snp.top).offset(10)
                make.bottom.equalTo(view.snp.bottomMargin)
            }
        }
    }
}
