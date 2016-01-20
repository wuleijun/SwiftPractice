//
//  RJSignView.swift
//  SwiftPractice
//
//  Created by 吴蕾君 on 16/1/15.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit
import SnapKit


protocol RJSignViewDelegate{
    /**
     save current image
     */
    func signViewDidSave(image :UIImage?)
}

class RJSignView: UIView {

    // MARK: Private Var
    private var drawingPath:UIBezierPath!
    //Keep track the four points of bezierPath segment
    private var points = [CGPoint](count: 4, repeatedValue: CGPointZero)
    private var currentTrackIndex = 0
    
    
    private lazy var clearButton : UIButton = {
        let button:UIButton = UIButton()
        button.setTitle("重签", forState:.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.backgroundColor = UIColor.lightGrayColor()
        button.addTarget(self, action: "clearAction", forControlEvents:.TouchUpInside)
        return button
    }()
    private lazy var saveButton : UIButton = {
        let saveButton : UIButton = UIButton()
        saveButton.setTitle("保存", forState: .Normal)
        saveButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        saveButton.backgroundColor = UIColor.lightGrayColor()
        saveButton.addTarget(self, action: "saveAction", forControlEvents: .TouchUpInside)
        return saveButton
    }()
    private lazy var indicatorLabel : UILabel = {
       let label = UILabel()
        label.text = "请在此签名"
        label.textColor = UIColor.init(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        return label
    }()
    
    // MARK: Public Var
    var lineWidth:CGFloat = 2.0{
        didSet{
            self.drawingPath?.lineWidth = lineWidth
        }
    }
    var cacheImage:UIImage?
    var delegate:RJSignViewDelegate?
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // MARK: Actions
    func clearAction(){
        cacheImage = nil
        self.drawingPath.removeAllPoints()
        self .setNeedsDisplay()
        indicatorLabel.hidden = false
    }
    
    func saveAction(){
        self.delegate?.signViewDidSave(self.cacheImage)
    }
    
    
    // MARK: Helper
    private func setup(){
        self.multipleTouchEnabled = false
        self.backgroundColor = UIColor.whiteColor()
        self.drawingPath = UIBezierPath()
        self.drawingPath.lineCapStyle = CGLineCap.Round
        self.drawingPath.lineJoinStyle = CGLineJoin.Round
        
        self.addSubview(clearButton)
        clearButton.snp_makeConstraints{ (make) -> Void in
            make.left.bottom.equalTo(self)
            make.size.equalTo(CGSizeMake(50, 30))
        }
        
        self.addSubview(saveButton)
        saveButton.snp_makeConstraints { (make) -> Void in
            make.right.bottom.equalTo(self)
            make.size.equalTo(clearButton)
        }
        
        self.addSubview(indicatorLabel)
        indicatorLabel.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self)
        }
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
    
    // MARK: Overdide
    override func drawRect(rect: CGRect) {
        self.cacheImage?.drawInRect(rect)
        self.drawingPath.stroke()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.currentTrackIndex  = 0
        let touch:UITouch! = touches.first;
        points[0] = touch.locationInView(self)
        indicatorLabel.hidden = true
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


