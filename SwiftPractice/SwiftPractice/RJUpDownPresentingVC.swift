//
//  RJUpDownPresentingVC.swift
//  SwiftPractice
//
//  Created by 吴蕾君 on 16/3/14.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class RJUpDownPresentingVC: UIViewController {

    let upDownTransition = RJUpDownTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Up and Down";
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = false
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .Custom
    }
}

extension RJUpDownPresentingVC:UIViewControllerTransitioningDelegate{
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        upDownTransition.transitionMode = .Present
        return upDownTransition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        upDownTransition.transitionMode = .Dismiss
        return upDownTransition
    }
}
