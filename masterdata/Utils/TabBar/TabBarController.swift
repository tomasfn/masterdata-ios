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
                
        let assetsScene = assetsVc
        let walletsScene = walletsVc
                                
        assetsScene.floatingTabItem = assetTabItem
        walletsScene.floatingTabItem = walletsTabItem

        self.viewControllers = [assetsVc, walletsVc]
    }
}
