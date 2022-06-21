//
//  orderViewModel.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/06/21.
//

import Foundation
import Firebase

struct OrderModel {
    let cafeName: String
    let menu1: String
    let menu2: String
    let menuCount1: String
    let menuCount2: String
    let menu1price: String
    let menu2price: String
    let totalprice: String
    let time: Timestamp
}

final class OrderViewModel {
    
    let model: Observer<[OrderModel]> = Observer(value: [])
    
    
    func fetch() {
       let user = Auth.auth().currentUser?.uid
        Firestore.firestore().collection("user").document(user ?? "").collection("order").addSnapshotListener { snapshot, error in
            guard let snapshot = snapshot?.documents else { return }
            let models = snapshot.map {
                OrderModel(
                    cafeName: $0.data()["cafeName"] as? String ?? "",
                    menu1: $0.data()["menu1"] as? String ?? "",
                    menu2: $0.data()["menu2"] as? String ?? "",
                    menuCount1: $0.data()["menu1count"] as? String ?? "",
                    menuCount2: $0.data()["menu2count"] as? String ?? "",
                    menu1price: $0.data()["menu1Price"] as? String ?? "",
                    menu2price: $0.data()["menu2Price"] as? String ?? "",
                    totalprice: $0.data()["totalPrice"] as? String ?? "",
                    time: $0.data()["time"] as? Timestamp ?? Timestamp(date: Date())
                )
            }
            self.model.value = models
        }
    }
}
