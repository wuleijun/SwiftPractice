//
//  ViewController.swift
//  SwiftPractice
//
//  Created by 吴蕾君 on 16/1/8.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit
import Alamofire

let ARHomeCellId:String = "ARHomeCellId";

class ARHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController!.navigationBar.hidden = true
        
        let signView = RJSignView.init(frame: CGRectMake(0, 0, 500, 500))
        self.view.addSubview(signView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ARHomeViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCellWithIdentifier(ARHomeCellId) as! ARHomeCell
        return homeCell
    }
    
}

extension ARHomeViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
