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

class ERNNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor.blue
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismiss))
        let cancel2 = UIBarButtonItem(title: "Test", style: .plain, target: self, action: nil)
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = cancel2
        self.navigationItem.rightBarButtonItem = cancel
        self.title = "Modal"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
