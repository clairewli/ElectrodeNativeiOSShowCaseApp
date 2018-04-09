//
//  MovieDetailRouter.swift
//  ElectrodeNativeIOSShowCaseApp
//
//  Created by Claire Weijie Li on 3/19/18.
//  Copyright © 2018 WalmartLabs. All rights reserved.
//

import UIKit

struct MovieDetailRouteDelegate: Routable {
    func navigate(to screen: Route, from currentViewController: UIViewController) throws {
        let path = screen.path
        let miniappNameLowerBound = path.range(of: "ern/")!.upperBound
        let paramsLowerBound = path.range(of:"/?")!.lowerBound
        let miniappName = String(path[miniappNameLowerBound..<paramsLowerBound])
         let payload = ["payload" : screen.payload  ?? ""]
        let detailViewController = ElectrodeReactNative.sharedInstance().miniApp(withName: miniappName, properties: payload)
        detailViewController.view.frame = currentViewController.view.frame
        detailViewController.title = "MovieDetails MiniApp"
        currentViewController.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
