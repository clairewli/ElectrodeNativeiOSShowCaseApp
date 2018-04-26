//
//  NavDemoCustomButtonsDelegate.swift
//  ElectrodeNativeIOSShowCaseApp
//
//  Created by Claire Weijie Li on 4/19/18.
//  Copyright © 2018 WalmartLabs. All rights reserved.
//

import Foundation
struct NavDemoCustomButtonsDelegate: Routable {
    func navigate(to screen: Route, from currentViewController: UIViewController) throws {
        let miniAppViewController = ElectrodeReactNative.sharedInstance().miniApp(withName: "NavDemoMiniApp/custom_buttons", properties: nil)
        let rootView = miniAppViewController.view
        
        guard let rv = rootView else {
            return
            
        }
        let baseVC = ERNBaseViewController()
        rv.frame = UIScreen.main.bounds
        baseVC.view.addSubview(rv)
        currentViewController.navigationController?.pushViewController(baseVC, animated: true)

    }
}
