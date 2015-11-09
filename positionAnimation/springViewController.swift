//
//  springViewController.swift
//  positionAnimation
//
//  Created by test on 10/28/15.
//  Copyright © 2015 Mrtang. All rights reserved.
//

import UIKit

class springViewController: UIViewController {

    @IBOutlet weak var yellowRect: UIView!
    @IBOutlet weak var greenRect: UIView!
    @IBOutlet weak var orangeRect: UIView!
    
    var panGesture:UIPanGestureRecognizer!
    var currentPosition:CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.panGesture = UIPanGestureRecognizer(target: self, action: "pan:")
        self.yellowRect.userInteractionEnabled = true
        self.yellowRect.addGestureRecognizer(panGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.orangeRect.center.x = self.view.bounds.width - self.orangeRect.center.x
            }, completion: nil)
        
        UIView.animateWithDuration(50, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.greenRect.center.x = self.view.bounds.width - self.greenRect.center.x

            }, completion: nil)
        
        UIView.animateWithDuration(3, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.yellowRect.center.x = self.view.bounds.width - self.yellowRect.center.x
            
            }, completion: nil)

    }
    
    func pan(gesture:UIPanGestureRecognizer) {
        var gesturePositon = gesture.locationInView(self.view)
        //if (self.yellowRect.frame.contains(gesturePositon)) {
            if gesture.state == UIGestureRecognizerState.Began {
                self.yellowRect.center.x = gesturePositon.x
            }

        //}

        
        
        if gesture.state == UIGestureRecognizerState.Changed {
            self.yellowRect.center.x = gesturePositon.x
        }
        
        if gesture.state == UIGestureRecognizerState.Ended {
            //self.yellowRect.center.x = gesturePositon.x
            UIView.animateWithDuration(5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: { () -> Void in
                self.yellowRect.center.x = self.view.bounds.width - 37
                
                }, completion: nil)

        }

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
