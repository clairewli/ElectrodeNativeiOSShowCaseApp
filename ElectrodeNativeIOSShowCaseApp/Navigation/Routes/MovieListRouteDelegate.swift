//
//  MovieListRouter.swift
//  ElectrodeNativeIOSShowCaseApp
//
//  Created by Claire Weijie Li on 3/19/18.
//  Copyright © 2018 WalmartLabs. All rights reserved.
//

import UIKit

struct MovieListRouteDelegate: Routable {
    func navigate(to screen: Route, from currentViewController: UIViewController) throws {
        
        if let popRoute = screen as? PopRoute {
            if (popRoute.popToRoot) {
                currentViewController.navigationController?.popToRootViewController(animated: popRoute.animated)
            }
        } else {
            let moviewListvc = MovieListViewController()
            currentViewController.navigationController?.pushViewController(moviewListvc, animated: true)
        }
    }
}
