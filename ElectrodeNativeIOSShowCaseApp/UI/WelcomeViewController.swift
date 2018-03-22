//
//  WelcomeViewController.swift
//  ElectrodeNativeIOSShowCaseApp
//
//  Created by Claire Weijie Li on 3/21/18.
//  Copyright © 2018 WalmartLabs. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    var viewControllerIndex: Int?
    @IBAction func popToRootClicked(_ sender: Any) {
        
    }
    
    @IBOutlet weak var viewControllerLabel: UILabel!
    
    @IBAction func didPress(_ sender: Any) {
        let route = Route("welcome", nil, viewControllerIndex!+1)
        try? Navigator.sharedInstance.push(to: route)
    }
    
    convenience init (index: Int) {
        self.init()
        self.viewControllerIndex = index
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let index = viewControllerIndex ?? 0
        self.viewControllerIndex = index
        self.viewControllerLabel.text = "View Controller \(index)"
    }
}
