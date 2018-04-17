//
//  Router.swift
//  ElectrodeNativeIOSShowCaseApp
//
//  Created by Claire Weijie Li on 3/19/18.
//  Copyright © 2018 WalmartLabs. All rights reserved.
//

import UIKit
import Foundation
enum ValidRoute: String {
    static let ernPrefix = "ern/"
    case welcome = "welcome"
    case movieList = "movielistminiapp"
    case movieDetails = "MovieDetailsMiniApp"
    case navDemoPush = "NavDemoMiniApp/push_screen"
    case navDemoModal = "NavDemoMiniApp/show_modal"
    var getPath: String {
            return "\(ValidRoute.ernPrefix)\(self.rawValue)"
    }
}

class Router: Routable {
    static let internalScheme = "walmart"
    private var routes = [String: Routable]()
    var errorHandler: ErrorRoutable?
    func register(route: String) {
        let validRoute = ValidRoute(rawValue: route)
        let mappedDelegate = mapRouteWithDelegate(route: validRoute)
        guard let delegate = mappedDelegate, let route = validRoute else {
            return
        }
        routes[route.getPath] = delegate
        print(routes)
    }
    
    private func mapRouteWithDelegate(route: ValidRoute?) -> Routable? {
        switch (route) {
        case .welcome?:
            return WelcomeRouteDelegate()
        case .movieList?:
            return MovieListRouteDelegate()
        case .movieDetails?:
            return MovieDetailRouteDelegate()
        case .navDemoPush?:
            return NavDemoPushDelegate()
        case .navDemoModal?:
            return NavDemoModalDelegate()
        default:
            return nil
        }
    }
    
    func navigate(to route: Route, from currentViewController: UIViewController) throws {
        print(routes)
        guard let validPath = Utility.findRoutingPathWithoutParams(route: route) else {
            print("do nothing")
            return
        }
        if let delegate = routes[validPath] {
            do {
                try delegate.navigate(to: route, from: currentViewController)
            } catch {
                errorHandler?.handle(error: error, from: currentViewController)
            }
        }
    }
}
