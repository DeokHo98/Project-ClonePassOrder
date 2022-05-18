//
//  TabBarController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/17.
//

import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setAttribute()
    }
    
    //MARK: - HelperFunction
    
    private func setNavigation() {
        let homeCV = HomeViewController()
        let orderHistoryCV = OrderHistoryViewController()
        let favoriteCV = FavoriteViewController()
        let qrCameraCV = qrCameraViewController()
        let myPasserCV = MyPasserViewController()
        let homeNavi = templatNavigation(
            title: "홈",
            image: UIImage(systemName: "cup.and.saucer.fill")!,
            rootViewController: homeCV
        )
        let orderHistoryNavi = templatNavigation(
            title: "주문내역",
            image: UIImage(systemName: "list.bullet.rectangle.portrait.fill")!,
            rootViewController: orderHistoryCV
        )
        let favoriteNavi = templatNavigation(
            title: "자주가요",
            image: UIImage(systemName: "star.fill")!,
            rootViewController: favoriteCV
        )
        let qrCameraNavi = templatNavigation(
            title: "큐알주문",
            image: UIImage(systemName: "qrcode")!,
            rootViewController: qrCameraCV
        )
        let myPasserNavi = templatNavigation(
            title: "마이패써",
            image: UIImage(systemName: "smiley.fill")!,
            rootViewController: myPasserCV
        )
        viewControllers = [homeNavi,orderHistoryNavi,favoriteNavi,qrCameraNavi,myPasserNavi]
    }
    private func setAttribute() {
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        tabBar.addShadow()
    }
    private func templatNavigation(
        title: String,
        image: UIImage,
        rootViewController: UIViewController
    ) -> UINavigationController {
        let navi = UINavigationController(rootViewController: rootViewController)
        navi.tabBarItem.image = image
        navi.tabBarItem.title = title
        return navi
    }
    

}
