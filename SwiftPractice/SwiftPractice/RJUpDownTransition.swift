//
//  RJUpDownTransition.swift
//  SwiftPractice
//
//  Created by 吴蕾君 on 16/3/15.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit


public class RJUpDownTransition: NSObject {
    
    public enum TransitonMode: String {
        case Present,Dismiss
    }
    public var duration = 0.5
    public var transitionMode = TransitonMode.Present
    
}

extension RJUpDownTransition:UIViewControllerAnimatedTransitioning{
    public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        guard let containerView = transitionContext.containerView() else {
            return
        }
    
        let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!.view
        let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!.view
        
        
        if(transitionMode == .Present){
            
            toView.y = toView.height
            containerView.addSubview(toView)
            
            UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    toView.y = 0
                    fromView.y = -fromView.height
                }, completion: { (_) -> Void in
                     transitionContext.completeTransition(true)
            })
        }else{
            
            UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    toView.y = 0
                    fromView.y = fromView.height
                }, completion: { (_) -> Void in
                    fromView.removeFromSuperview()
                    transitionContext.completeTransition(true)
            })
        }
    }
    
    public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration;
    }
}
