//
//  NavigationHelper.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 17/11/21.
//

import Foundation
import UIKit

class NavigationHelper {
    
    static let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
    static let tabStoryboard = UIStoryboard.init(name: "tabbar", bundle: nil)

    class func assetsViewController(dataAttributes: DataAttributes? = nil) -> AssetsViewController {
        let assetsVc = mainStoryboard.instantiateViewController(withIdentifier: AssetsViewController.nameOfClass) as! AssetsViewController
        return assetsVc
    }
    
    class func walletsViewController() -> WalletViewController {
        let walletsVc = mainStoryboard.instantiateViewController(withIdentifier: WalletViewController.nameOfClass) as! WalletViewController
        return walletsVc
    }
    
    class func splashViewController() -> SplashViewController {
        let splashVc = mainStoryboard.instantiateViewController(withIdentifier: SplashViewController.nameOfClass) as! SplashViewController
        return splashVc
    }
    
    class func tabBarViewController() -> TabBarController {
        let mainStoryboard = UIStoryboard(name: "tabbar", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: TabBarController.nameOfClass) as! TabBarController
        return vc
    }
    
    class func walletBalancesViewController() -> WalletBalancesViewController {
        let walletBalancesVC = mainStoryboard.instantiateViewController(withIdentifier: WalletBalancesViewController.nameOfClass) as! WalletBalancesViewController
        return walletBalancesVC
    }
}

//MARK: - Set Root ViewController
extension NavigationHelper {
    class func setRootViewController(_ viewController: UIViewController?) {
        guard let viewController = viewController else { return }
        let navigationController = UINavigationController(rootViewController: viewController)

        navigationController.isNavigationBarHidden = false
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
