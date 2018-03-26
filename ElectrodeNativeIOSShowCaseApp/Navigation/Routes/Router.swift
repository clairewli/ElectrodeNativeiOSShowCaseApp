//
//  Router.swift
//  ElectrodeNativeIOSShowCaseApp
//
//  Created by Claire Weijie Li on 3/19/18.
//  Copyright © 2018 WalmartLabs. All rights reserved.
//

import UIKit

enum ValidRoute: String {
    case welcome = "welcome"
}

class Router: Routable {
    static let internalScheme = "walmart"
    var routes = [String: Routable]()
    var errorHandler: ErrorRoutable?
    func register(route: String) {
        let delegate = mapRouteWithDelegate(route: route)
        routes[route] = delegate
    }
    
    private func mapRouteWithDelegate(route: String) -> Routable? {
        let route = ValidRoute(rawValue: route)
        switch (route) {
        case .welcome?:
            return WelcomeRouteDelegate()
        default:
            return nil
        }
    }
    
    func navigate(to route: Route, from currentViewController: UIViewController) throws {
        if let delegate = routes[route.path] {
            do {
                try delegate.navigate(to: route, from: currentViewController)
            } catch {
                errorHandler?.handle(error: error, from: currentViewController)
            }
        }
    }
}
