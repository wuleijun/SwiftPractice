//
//  RJPresentingVC.swift
//  SwiftPractice
//
//  Created by 吴蕾君 on 16/2/15.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class RJBubblePresentedVC: UIViewController {

    @IBAction func close_Touch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
