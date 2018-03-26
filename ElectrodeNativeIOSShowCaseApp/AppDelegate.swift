/*
 * Copyright 2017 WalmartLabs
 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 
 * http://www.apache.org/licenses/LICENSE-2.0
 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    var mainController: ERNTabBarController?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        // Must initialize the container before we can access it within the app.
        ElectrodeWrapper.setupContainer()
        setupRootVC()
        setupRouting()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        try? Navigator.sharedInstance.navigate(url: url)
        return true
    }
}

extension AppDelegate {
    
    func setupRootVC() {
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        let initialVC = sb.instantiateViewController(withIdentifier: "tabBarController")
        window?.rootViewController = initialVC
        self.mainController = initialVC as? ERNTabBarController
    }
    func setupRouting() {
        Navigator.sharedInstance.setupExecutionBlock({ [weak self ] route in
            guard let selectedController = self?.mainController?.selectedViewController else {
                return
            }
            let currentController = (selectedController as? UINavigationController)?.topViewController
                ?? selectedController
            
            try? Navigator.sharedInstance.navigate(to: route, from: currentController)
            
            
        })
        
        Navigator.sharedInstance.registerRoute(route: "welcome")
        Navigator.sharedInstance.registerRoute(route: ValidRoute.movieList.rawValue)
    }
}

