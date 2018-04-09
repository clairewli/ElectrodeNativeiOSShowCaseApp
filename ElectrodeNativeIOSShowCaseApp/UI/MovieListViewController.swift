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

class MovieListViewController: ERNBaseViewController
{
    static let identifier = "movielist"
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.addMovieListMiniAppView()
        self.configureNavigation()
    }
    
    /**
     Creates a view that houses the movie list mini app and gives it the full screen minus enough space
     for the nav bar.
     */
    private func addMovieListMiniAppView()
    {
        // Create a view controller to house the movie list mini app.
        let miniAppViewController = ElectrodeReactNative.sharedInstance().miniApp(withName: "MovieListMiniApp", properties: nil)
        
        // Set the movie list's frame to fit within the area visible under the nav bar.
        var frame = self.view.frame
        if let navBarFrame = self.navigationController?.navigationBar.frame
        {
            frame.origin.y += navBarFrame.size.height
            frame.size.height -= navBarFrame.size.height
        }
        miniAppViewController.view.frame = frame
        
        // Add the mini app's view to our view.
        self.view.addSubview(miniAppViewController.view)
    }
    
    /**
     Configures the navigation behavior for when the user taps on a movie in the movie list.  This
     method will make it so that action will send the user to a detail screen for the selected movie.
     */
    private func configureNavigation()
    {
//        let navigationApi = NavigationAPI()
//        navigationApi.requests.registerNavigateRequestHandler { (data, completion) in
//
//            // Grab the navigation data and navigation controller.
//            guard
//                let navigationData = data as? NavigateData,
//                let navController = self.navigationController else
//            {
//                // If we have no navigation data, or a navigation controller, then we can't do anything.
//                completion(nil, nil)
//                return
//            }
//            let payload = ["payload" : navigationData.initialPayload ?? ""]
//
//            // Create the view controller for the movie details mini app and push it onto the nav controller.
//            let detailViewController = ElectrodeReactNative.sharedInstance().miniApp(withName: navigationData.miniAppName, properties: payload)
//            detailViewController.view.frame = self.view.frame
//            detailViewController.title = "MovieDetails MiniApp"
//            navController.pushViewController(detailViewController, animated: true)
//
//            // Inform the handler that we are done.
//            completion(nil, nil)
//        }
        
        let showchaseNavAPI = ShowcaseNavigationAPI()
        showchaseNavAPI.requests.registerNavigateRequestHandler { (route, completionHandler) in
            guard let detailRoute = route as? ErnRoute else {
                completionHandler(nil, nil)
                return
            }
            

            let route = Route(detailRoute.path, nil, detailRoute.payload)
            try? Navigator.sharedInstance.navigate(to: route)
            
        }
    }
}

