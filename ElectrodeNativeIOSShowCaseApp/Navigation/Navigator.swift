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
    private  var internalScheme = "showcase"
    private var scheme:String {
        get { return "\(internalScheme)://"}
    }
    
    private  var routePathToDelegateMap = [String: Routable]()
    fileprivate var execute: ((Route, (() -> Void)?) -> Void)?
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
        if let payload = payload {
            
        } else {
            let route = createRoute(url: url)
            if let route = route {
                try? Navigator.sharedInstance.navigate(to: route)
            }
        }
    }
    
    func setupExecutionBlock(_ block: @escaping ((Route, (() -> Void)?) -> Void)) {
        Navigator.sharedInstance.execute = block
    }
    
    func resetToInitial(route: Route) throws {
        execute?(route, nil)
    }
    // convinient API for native internal navigation.
    
    func navigate(to screen: Route) throws {
        execute?(screen, nil)
    }
    
    // call navigation into navigator
    func navigate(to screen: Route, from currentViewController: UIViewController) throws {
        try? router.navigate(to: screen, from: currentViewController)
    }
    
    private func createRoute(url: URL) -> Route? {
        let path = String(url.absoluteString.suffix(from: self.scheme.endIndex))
        let route = ValidRoute(rawValue: path)
        if let route = route {
            let screen = Route(route.rawValue, nil, nil)
            return screen
        } else {
            return nil
        }
    }
    
    private func parse(url: URL, payload: Any? = nil) -> Route? {
        return nil
    }
}
