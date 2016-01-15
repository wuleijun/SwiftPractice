//
//  RJSignView.swift
//  SwiftPractice
//
//  Created by 吴蕾君 on 16/1/15.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class RJSignView: UIView {

    // MARK: Private Var
    private var drawingPath:UIBezierPath!
    //Keep track the four points of bezierPath segment
    private var points = [CGPoint](count: 4, repeatedValue: CGPointZero)
    private var currentTrackIndex = 0
    
    // MARK: Public Var
    var lineWidth:CGFloat = 2.0{
        didSet{
            self.drawingPath?.lineWidth = lineWidth
        }
    }
    var cacheImage:UIImage?
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    
    // MARK: ---
    private func setup(){
        self.multipleTouchEnabled = false
        self.backgroundColor = UIColor.whiteColor()
        self.drawingPath = UIBezierPath()
        self.drawingPath.lineCapStyle = CGLineCap.Round
        self.drawingPath.lineJoinStyle = CGLineJoin.Round
    }
    
    private func drawCacheImage(){
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0.0)
        UIColor.blackColor().setStroke()
        if(cacheImage == nil){
            let bezierPath = UIBezierPath.init(rect: self.bounds)
            UIColor.whiteColor().setFill()
            bezierPath.fill()
        }
        self.cacheImage?.drawAtPoint(CGPointZero)
        self.drawingPath.stroke()
        self.cacheImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // MARK: ---
    override func drawRect(rect: CGRect) {
        self.cacheImage?.drawInRect(rect)
        self.drawingPath.stroke()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.currentTrackIndex  = 0
        let touch:UITouch! = touches.first;
        points[0] = touch.locationInView(self)
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch:UITouch! = touches.first;
        let movedPoint = touch.locationInView(self)
        self.currentTrackIndex++
        points[self.currentTrackIndex] = movedPoint
        if(self.currentTrackIndex == 3){
            drawingPath.moveToPoint(points[0])
            drawingPath.addCurveToPoint(points[3], controlPoint1:points[1], controlPoint2: points[2]);
            self.setNeedsDisplay()
            points[0] = (self.drawingPath?.currentPoint)!
            self.currentTrackIndex = 0
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.drawCacheImage()
        self.setNeedsDisplay()
        self.points[0] = self.drawingPath.currentPoint
        self.drawingPath.removeAllPoints()
        self.currentTrackIndex = 0
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        self.touchesEnded(touches!, withEvent: event)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
