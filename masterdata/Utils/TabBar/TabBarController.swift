//
//  TabBarController.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 18/11/21.
//

import Foundation
import FloatingTabBarController

class TabBarController: FloatingTabBarController {
    
    let assetsVc = NavigationHelper.assetsViewController()
    let walletsVc = NavigationHelper.walletsViewController()
    
    let assetTabItem = FloatingTabItem(image: UIImage(named: "assetTab")!)
    let walletsTabItem = FloatingTabItem(image: UIImage(named: "walletTab")!)
                    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }
    
    func setUpTabBar() {
        
        tabBarController?.delegate = self
        
        let assetsScene = assetsVc
        let walletsScene = walletsVc
                                
        assetsScene.floatingTabItem = assetTabItem
        walletsScene.floatingTabItem = walletsTabItem

        self.viewControllers = [assetsVc, walletsVc]
    }
}

extension TabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        print(viewController)
        return true
    }
    
}
