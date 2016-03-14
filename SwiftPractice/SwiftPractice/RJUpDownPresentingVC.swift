//
//  RJUpDownPresentingVC.swift
//  SwiftPractice
//
//  Created by 吴蕾君 on 16/3/14.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class RJUpDownPresentingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Up and Down";
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RJUpDownPresentedVC:UIViewControllerTransitioningDelegate{
    
}
