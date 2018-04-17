//
//  NavDemoModalDelegate.swift
//  ElectrodeNativeIOSShowCaseApp
//
//  Created by Claire Weijie Li on 4/11/18.
//  Copyright © 2018 WalmartLabs. All rights reserved.
//

import Foundation

class NavDemoModalDelegate: NSObject, Routable {
    var modalNav: UINavigationController?
    func navigate(to screen: Route, from currentViewController: UIViewController) throws {
        let payload = (screen.payload as? String) ?? ""
        let props = ["payload": payload] as [AnyHashable: Any]
        let miniAppViewController = ElectrodeReactNative.sharedInstance().miniApp(withName: "NavDemoMiniApp/show_modal", properties: props)
        let rootView = miniAppViewController.view

        guard let rv = rootView else {
            return
            
        }
        let baseVC = ERNBaseViewController()
        rv.frame = UIScreen.main.bounds
        baseVC.view.addSubview(rv)
        let nav  = ERNNavigationController(rootViewController: baseVC)
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismiss))
        let cancel2 = UIBarButtonItem(title: "Test", style: .plain, target: self, action: nil)
        nav.navigationItem.hidesBackButton = true
        nav.navigationItem.leftBarButtonItem = cancel2
        nav.navigationItem.rightBarButtonItem = cancel
        nav.title = "Modal"
        currentViewController.navigationController?.present(nav, animated: true, completion: nil)
    }
    
    @objc func dismiss() {
        self.modalNav?.dismiss(animated: true, completion: nil)
    }
}
