//
//  WelcomeRouteDelegate.swift
//  ElectrodeNativeIOSShowCaseApp
//
//  Created by Claire Weijie Li on 3/21/18.
//  Copyright © 2018 WalmartLabs. All rights reserved.
//

import UIKit

struct WelcomeRouteDelegate: Routable {
    func navigate(to screen: Route, from currentViewController: UIViewController) throws {
        let index = screen.payload as! Int
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        let welcomeVC = sb.instantiateViewController(withIdentifier: "welcome") as! WelcomeViewController
        welcomeVC.viewControllerIndex = index
        currentViewController.navigationController?.pushViewController(welcomeVC, animated: true)
        
    }
}
