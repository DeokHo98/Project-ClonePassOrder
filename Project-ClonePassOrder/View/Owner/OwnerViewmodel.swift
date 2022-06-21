//
//  import Foundation  final class OwnerViewModel {          let service = OwnerService()          func orderListFetch() {         service.fetch {             print("디버그 새롭게 패치됨")         }     } }.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/06/21.
//

import Foundation

final class OwnerViewModel {
    
    let service = OwnerService()
    
    func orderListFetch() {
        service.fetch {
            print("디버그 새롭게 패치됨")
        }
    }
}
