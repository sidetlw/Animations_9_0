//
//  DynamicsViewController.swift
//  positionAnimation
//
//  Created by test on 11/11/15.
//  Copyright © 2015 Mrtang. All rights reserved.
//

import UIKit
import QuartzCore


class DynamicsViewController: UIViewController {

    @IBOutlet weak var greenRect: UIView!
    var animator:UIDynamicAnimator!
    var attachmentBehavior:UIAttachmentBehavior!
    var rect:UIView!
    var gestrue:UIPanGestureRecognizer!
    var lineLayer:LineLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rect = UIView(frame: CGRect(x: 100, y: 60, width: 70, height: 70))
        self.rect.backgroundColor = UIColor.greenColor()
        self.rect.transform = CGAffineTransformMakeRotation(45)
        let label = UILabel(frame: CGRect(x: 3, y: 15, width: 55, height: 15))
        label.text = "重力效果"
        label.adjustsFontSizeToFitWidth = true
        self.rect.addSubview(label)
        self.view.addSubview(self.rect)
        
        self.gestrue = UIPanGestureRecognizer(target: self, action: "gesture:")
        self.view.addGestureRecognizer(self.gestrue)
        
        self.animator = UIDynamicAnimator(referenceView: self.view)

        let gravityBeahvior = UIGravityBehavior(items: [self.rect])
        self.animator.addBehavior(gravityBeahvior)
        
        let collisionBeahvior = UICollisionBehavior(items: [self.rect])
        collisionBeahvior.translatesReferenceBoundsIntoBoundary = true
        collisionBeahvior.setTranslatesReferenceBoundsIntoBoundaryWithInsets(UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        self.animator.addBehavior(collisionBeahvior)
        

        
    }

    func gesture(gesture:UIPanGestureRecognizer) {
        if gesture.state == UIGestureRecognizerState.Began {
            
            
            let anchorPoint = CGPoint(x: self.rect.center.x, y: self.rect.center.y - 70)
            self.attachmentBehavior = UIAttachmentBehavior(item: self.rect, offsetFromCenter: UIOffset(horizontal: -33, vertical: -33), attachedToAnchor: anchorPoint)
            //self.animator.removeBehavior(self.attachmentBehavior)
            self.animator.addBehavior(self.attachmentBehavior)
        }
        else if gesture.state == UIGestureRecognizerState.Changed {
            if (self.rect.frame.contains(gesture.locationInView(self.view))) {
                self.attachmentBehavior.anchorPoint = CGPoint(x: self.rect.center.x, y: self.rect.center.y - 170)
            }
            else {
                self.attachmentBehavior.anchorPoint = gesture.locationInView(self.view)
            }
            
            
            
            /* 　//这段代码用来加一条线，但是attachmentBehavior没用回调，好像做不到
            if let layer = self.lineLayer {
                layer.removeFromSuperlayer()
            }
            
            lineLayer = LineLayer(firstPoint: CGPoint(x: self.rect.frame.origin.x + 3, y: self.rect.frame.origin.y + 3),secondPoint: self.attachmentBehavior.anchorPoint)
                        self.view.layer.addSublayer(lineLayer)
            lineLayer.frame = self.view.bounds
            lineLayer.setNeedsDisplay()
            */

        }
        else if gesture.state == UIGestureRecognizerState.Ended {
            self.animator.removeBehavior(self.attachmentBehavior)
//            if let layer = self.lineLayer {
//                layer.removeFromSuperlayer()
//            }

        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
