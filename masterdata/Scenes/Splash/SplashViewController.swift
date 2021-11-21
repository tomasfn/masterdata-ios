//
//  SplashViewController.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 17/11/21.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRootViewController()
    }

    private func setRootViewController() {
        let rootVc = NavigationHelper.tabBarViewController()
        NavigationHelper.setRootViewController(rootVc)
    }
}
