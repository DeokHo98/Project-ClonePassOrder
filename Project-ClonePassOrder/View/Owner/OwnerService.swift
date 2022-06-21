//
//  OwnerService.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/06/21.
//

import Foundation
import Firebase

struct OwnerService {
    
    func fetch(completion: @escaping () -> Void) {
        Firestore.firestore().collection("cafe").document("빽다방 동두천지행점").collection("order").addSnapshotListener { snapshot, error in
            guard let doc = snapshot?.documents else {return}
            doc.forEach { _ in
                completion()
            }
        }
    }
}
