//
//  Route.swift
//  ElectrodeNativeIOSShowCaseApp
//
//  Created by Claire Weijie Li on 3/19/18.
//  Copyright © 2018 WalmartLabs. All rights reserved.
//

import UIKit
/* for example, a movie detail route will be
// path = "moviedetails: {movieId}"
// arguments = [
 "movieId": "3r0fdr"
 ]
 //  payload: any native objects needs to be passed.
*/

public protocol Routable {
    func navigate(to screen: Route, from currentViewController: UIViewController) throws
}

public protocol ErrorRoutable {
    func handle(error : Error, from currentViewController: UIViewController)
}

public enum RouteError: Error {
    case NotFound
    case InvalidArgument(route: Route)
}


public class PopRoute: Route {
    let popToRoot: Bool
    let animated: Bool
    init(_ path: String, _ arguments: [String: String]?, _ payload: Any?, popToRoot: Bool, animated: Bool = false) {
        self.popToRoot = popToRoot
        self.animated = animated
        super.init(path, nil, nil)
    }
}

public class Route: NSObject {
    let path: String
    let decodedArgs: [AnyHashable: Any]?
    let payload: Any?
    init(_ path: String, _ arguments: [String: String]? = nil, _ payload: Any? = nil) {
        self.path = path
        self.decodedArgs = Utility.decode(arguments)
        self.payload = payload
    }
}

struct Utility {
    static func decode(_ arguments: [String: String]?) -> [AnyHashable: Any] {
        
        //CLAIRE TODO
        return [AnyHashable: Any]()
    }
    
    static func findRoutingPathWithoutParams(route: Route) -> String? {
        let path = route.path
        if let paramsLowerBound = path.range(of:"/?")?.lowerBound {
            let modulesStr = String(path[..<paramsLowerBound])
            return modulesStr
        } else {
            return path
        }
    }
}
