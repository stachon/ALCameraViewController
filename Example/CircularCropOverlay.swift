//
//  CircularCropOverlay.swift
//  ALCameraViewController
//
//  Created by Martin Stachon on 23.02.16.
//  Copyright © 2016 zero. All rights reserved.
//

import UIKit

class CircularCropOverlay: UIView {
  
    internal init() {
      super.init(frame: CGRectZero)
      setup()
    }
    
    internal override init(frame: CGRect) {
      super.init(frame: frame)
      setup()
    }
    
    internal required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }

  override func layoutSubviews() {
    let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.frame.width/2, y: self.frame.height/2),
      radius: min(CGFloat(self.frame.width/2), CGFloat(self.frame.height/2)),
      startAngle: CGFloat(0),
      endAngle:CGFloat(M_PI * 2),
      clockwise: true)
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = circlePath.CGPath
    
    //change the fill color
    shapeLayer.fillColor = UIColor.clearColor().CGColor
    //you can change the stroke color
    shapeLayer.strokeColor = UIColor.redColor().CGColor
    //you can change the line width
    shapeLayer.lineWidth = 3.0
    
    self.layer.addSublayer(shapeLayer)
  }
  
    func setup() {
      self.userInteractionEnabled = false
    }
  

}
