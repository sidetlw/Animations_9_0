//
//  lineLayer.swift
//  positionAnimation
//
//  Created by test on 11/12/15.
//  Copyright © 2015 Mrtang. All rights reserved.
//

import UIKit
import QuartzCore

class LineLayer: CALayer {

    var firstPoint:CGPoint!
    var secondPoint:CGPoint!
    
    init(firstPoint:CGPoint,secondPoint:CGPoint) {
        super.init()
        self.firstPoint = firstPoint
        self.secondPoint = secondPoint
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawInContext(ctx: CGContext) {
        let path = UIBezierPath()
        path.moveToPoint(self.firstPoint)
        path.addLineToPoint(self.secondPoint)
        path.lineWidth = 1.0
        
        CGContextSetStrokeColorWithColor(ctx, UIColor.redColor().CGColor)
        CGContextAddPath(ctx, path.CGPath)
        CGContextStrokePath(ctx) //只为曲线着色

    }
}
