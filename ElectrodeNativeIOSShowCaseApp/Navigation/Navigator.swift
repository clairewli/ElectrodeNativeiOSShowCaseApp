//
//  Navigator.swift
//  ElectrodeNativeIOSShowCaseApp
//
//  Created by Claire Weijie Li on 3/19/18.
//  Copyright © 2018 WalmartLabs. All rights reserved.
//

import UIKit

struct Navigator {
    private static var internalScheme = ""
    
    private static var routePathToDelegateMap = [String: Routable]()
    private static var execute: ((Route) -> Void)?
    static func registerRoute(route: Route, routingDelegate: Routable) {
        routePathToDelegateMap[route.path] = routingDelegate
    }
    
    static func registerRoute(routesDict: [String: Routable]) {
        for (key, val) in routesDict {
            routePathToDelegateMap[key] = val
        }
    }
    
    static func navigate(urn: String, payload: Any? = nil) throws {
        
    }
    
    static func navigate(url: URL, payload: Any? = nil) throws {
        
    }
    
    static func navigate(to screen: Route) throws {
        execute?(screen)
    }
}
