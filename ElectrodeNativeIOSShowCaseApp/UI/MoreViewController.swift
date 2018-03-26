//
//  MoreViewController.swift
//  ElectrodeNativeIOSShowCaseApp
//
//  Created by Claire Weijie Li on 3/22/18.
//  Copyright © 2018 WalmartLabs. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    var tableView: UITableView!
    var datasource: UITableViewDataSource?
//    lazy var datasource: MoreViewControllerDataSource = { [weak self] in
//        let ds = MoreViewControllerDataSource()
//        self?.tableView.dataSource = ds
//        return ds
//    }()
    override func viewDidLoad() {
        buildView()
        self.view.backgroundColor = UIColor.red
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    func buildView() {
        self.tableView = UITableView(frame:UIScreen.main.bounds, style: .plain)
        self.tableView.backgroundColor = UIColor.white
        self.datasource = MoreViewControllerDataSource()
        self.tableView.dataSource = self.datasource
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)

        self.view.layoutIfNeeded()
    }
}

class MoreViewControllerDataSource: NSObject, UITableViewDataSource {
    fileprivate let screens = [Route(ValidRoute.welcome.rawValue, nil, 0),
                   Route(ValidRoute.movieList.rawValue, nil, nil)
    
    ]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return screens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = screens[indexPath.row].path
        cell?.backgroundColor = UIColor.white
        return cell!
    }
    
}

extension MoreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let moreDS = self.datasource as? MoreViewControllerDataSource {
            let route = moreDS.screens[indexPath.row]
            try? Navigator.sharedInstance.navigate(to: route)
        }
    }
}
