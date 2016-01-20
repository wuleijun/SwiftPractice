//
//  ViewController.swift
//  SwiftPractice
//
//  Created by 吴蕾君 on 16/1/8.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit
import Alamofire

let RJHomeCellId:String = "RJHomeCellId";

class ARHomeViewController: UIViewController {

    let exampleTitles = ["RJSignView"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "SwiftPratice";
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
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
        return exampleTitles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCellWithIdentifier(RJHomeCellId) as! RJHomeCell
        homeCell.textLabel?.text = exampleTitles[indexPath.row]
        return homeCell
    }
    
}

extension ARHomeViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
