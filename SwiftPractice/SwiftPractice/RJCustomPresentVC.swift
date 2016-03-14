//
//  RJCustomPresentVC.swift
//  SwiftPractice
//
//  Created by 吴蕾君 on 16/2/15.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class RJCustomPresentVC: UIViewController {
    
    @IBOutlet weak var someButton:UIButton!
    let transition = BubbleTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CustomPresent"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .Custom
    }
}

extension RJCustomPresentVC:UIViewControllerTransitioningDelegate{
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Present
        transition.startingPoint = someButton.center
        transition.bubbleColor = someButton.backgroundColor!
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Dismiss
        transition.startingPoint = someButton.center
        transition.bubbleColor = someButton.backgroundColor!
        return transition
    }
}


