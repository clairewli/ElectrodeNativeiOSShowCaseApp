//
//  NavDemoModalDelegate.swift
//  ElectrodeNativeIOSShowCaseApp
//
//  Created by Claire Weijie Li on 4/11/18.
//  Copyright © 2018 WalmartLabs. All rights reserved.
//

import Foundation

struct NavDemoModalDelegate: Routable {
    func navigate(to screen: Route, from currentViewController: UIViewController) throws {
        let payload = (screen.payload as? String) ?? ""
        let props = ["payload": payload] as [AnyHashable: Any]
        let miniAppViewController = ElectrodeReactNative.sharedInstance().miniApp(withName: "NavDemoMiniApp/modal_Screen", properties: props)
        let rootView = miniAppViewController.view

        if let rv = rootView {
            let baseVC = ERNBaseViewController()
            rv.frame = UIScreen.main.bounds
            baseVC.view.addSubview(rv)
        }
    }
}
