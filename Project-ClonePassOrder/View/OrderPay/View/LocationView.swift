//
//  LocationView.swift
//  Project-ClonePassOrder
//
//  Created by miori Lee on 2022/05/25.
//

import Foundation
import SnapKit
import UIKit
import NMapsMap

class LocationView : UIView {
    let checkView: LeftImgRightLabelView = {
        let cv = LeftImgRightLabelView()
        cv.img.image = UIImage(systemName: "exclamationmark.circle.fill")
        cv.img.tintColor = .orange
        cv.label.text = "주문하시는 매장 위치를 확인해 주세요"
        cv.label.font = .systemFont(ofSize: 15, weight: .semibold)
        cv.backgroundColor = .systemGray5
        return cv
    }()
    let mapView = NMFMapView()
    let storeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "빽다방 동두천지행점"
        lb.font = .systemFont(ofSize: 12, weight: .medium)
        lb.textColor = .black
        return lb
    }()
    let locLabel: UILabel = {
        let lb = UILabel()
        lb.text = "경기 동두천시 동두천로 129 103호"
        lb.font = .systemFont(ofSize: 11, weight: .regular)
        lb.textColor = .lightGray
        return lb
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setAttribute()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setAttribute(){
        self.backgroundColor = .white
    }
    private func setLayout(){
        [checkView,mapView,storeLabel,locLabel].forEach { self.addSubview($0) }
        checkView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.centerX.equalToSuperview()
            make.leadingMargin.equalTo(10)
        }
        mapView.snp.makeConstraints { make in
            make.top.equalTo(checkView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.leadingMargin.equalTo(10)
            make.height.equalTo(200)
        }
        storeLabel.snp.makeConstraints { make in
            make.top.equalTo(mapView.snp.bottom).offset(5)
            make.leading.equalTo(checkView)
        }
        locLabel.snp.makeConstraints { make in
            make.top.equalTo(storeLabel.snp.bottom).offset(5)
            make.leading.equalTo(checkView)
            make.bottom.equalToSuperview().inset(12)
        }
        let info = NMFInfoWindow()
        let datasource = NMFInfoWindowDefaultTextSource.data()
        datasource.title = "빽다방 동두천지행점"
        info.offsetX = 0
        info.offsetY = 0
        info.dataSource = datasource
        info.position = NMGLatLng(lat: 37.892861, lng: 127.05396)
        info.open(with: mapView)
        let update = NMFCameraUpdate(position: NMFCameraPosition(NMGLatLng(lat: 37.892861, lng: 127.05396), zoom: 16))
        mapView.moveCamera(update)
    }
}
