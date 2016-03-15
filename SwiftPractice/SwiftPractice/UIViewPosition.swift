//
//  UIViewPosition.swift
//  SwiftPractice
//
//  Created by 吴蕾君 on 16/3/15.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit


public extension UIView {
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set (newX) {
            var frame: CGRect = self.frame
            frame.origin.x = newX
            self.frame = frame
        }
    }
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set (newY) {
            var frame: CGRect = self.frame
            frame.origin.y = newY
            self.frame = frame
        }
    }
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set (newWidth) {
            var frame: CGRect = self.frame
            frame.size.width = newWidth
            self.frame = frame
        }
    }
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set (newHeight) {
            var frame: CGRect = self.frame
            frame.size.height = newHeight
            self.frame = frame
        }
    }
    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set (newOrigin) {
            var frame: CGRect = self.frame
            frame.origin = newOrigin
            self.frame = frame
        }
    }
    var size: CGSize {
        get {
            return self.frame.size
        }
        set (newSize) {
            var frame: CGRect = self.frame
            frame.size = newSize
            self.frame = frame
        }
    }
    var bottom: CGFloat {
        get {
            return self.y + self.height
        }
        set (newBottom) {
            self.y = newBottom - self.height
        }
    }
    var right: CGFloat {
        get {
            return self.x + self.width
        }
        set (newRight) {
            self.x = newRight - self.width
        }
    }
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set (newCenterX) {
            self.center = CGPointMake(newCenterX, self.center.y)
        }
    }
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set (newCenterY) {
            self.center = CGPointMake(self.center.x, newCenterY)
        }
    }
}