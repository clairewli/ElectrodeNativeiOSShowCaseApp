//
//  Navigator.swift
//  ElectrodeNativeIOSShowCaseApp
//
//  Created by Claire Weijie Li on 3/19/18.
//  Copyright © 2018 WalmartLabs. All rights reserved.
//

import UIKit

class Navigator: Routable {
    static let sharedInstance = Navigator()
    fileprivate let router = Router()
    private  var internalScheme = ""
    
    private  var routePathToDelegateMap = [String: Routable]()
    fileprivate var execute: ((Route) -> Void)?
     func registerRoute(route: Route, routingDelegate: Routable) {
        routePathToDelegateMap[route.path] = routingDelegate
    }
    
    func register(route: String) {
        self.router.register(route: route)
    }
    
     func registerRoute(route: String) {
       self.router.register(route: route)
    }
    
     func navigate(urn: String, payload: Any? = nil) throws {
        
    }
    
     func navigate(url: URL, payload: Any? = nil) throws {
        
    }
    
    func setupExecutionBlock(_ block: @escaping ((Route) -> Void)) {
        Navigator.sharedInstance.execute = block
    }
    
    func resetToInitial(route: Route) throws {
        execute?(route)
    }
    // convinient API for native internal navigation.
    
    func navigate(to screen: Route) throws {
        execute?(screen)
    }
    
    
    // call navigation into navigator
    func navigate(to screen: Route, from currentViewController: UIViewController) throws {
        try? router.navigate(to: screen, from: currentViewController)
    }
}
