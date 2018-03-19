//
//  Router.swift
//  ElectrodeNativeIOSShowCaseApp
//
//  Created by Claire Weijie Li on 3/19/18.
//  Copyright © 2018 WalmartLabs. All rights reserved.
//

import UIKit

struct Router: Routable {
    var routes = [String: Routable]()
    var errorHandler: ErrorRoutable?
    func navigate(to route: Route, from currentViewController: UIViewController) throws {
        guard let delegate = routes[route.path] else {
            errorHandler?.handle(error: RouteError.NotFound, from: currentViewController)
            return
        }
        
        do {
            try delegate.navigate(to: route, from: currentViewController)
        } catch {
            errorHandler?.handle(error: error, from: currentViewController)
        }
    }
}
