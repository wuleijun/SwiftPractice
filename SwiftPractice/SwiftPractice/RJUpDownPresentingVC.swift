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
    private var percentDrivenTransition: UIPercentDrivenInteractiveTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Up and Down";
        // Do any additional setup after loading the view.
        upDownTransition.duration = 0.8
        
        addSwipeGestureRecognizer(self.view, direction:.Up)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .Custom
        addSwipeGestureRecognizer(controller.view, direction: .Down)
    }
    
    func swipeGesture(gesture:UISwipeGestureRecognizer){
        let progress = abs(gesture.locationInView(gesture.view!).y/gesture.view!.height)
        print("\(progress)")
        
        
        if gesture.direction == .Up {
            self.performSegueWithIdentifier("presentUpDown", sender: nil)
        } else if gesture.direction == .Down {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
        func addSwipeGestureRecognizer(view: UIView,direction:UISwipeGestureRecognizerDirection) {
            let gesture = UISwipeGestureRecognizer(target: self, action: Selector("swipeGesture:"))
            gesture.direction = direction
            view.addGestureRecognizer(gesture)
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
        
        //百分比Present
        func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
            return self.percentDrivenTransition
        }
        //百分比Dimiss
        func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
            return self.percentDrivenTransition
        }
}
