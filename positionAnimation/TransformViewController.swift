//
//  TransformViewController.swift
//  positionAnimation
//
//  Created by test on 10/27/15.
//  Copyright © 2015 Mrtang. All rights reserved.
//

import UIKit

class TransformViewController: UIViewController {

    @IBOutlet weak var transformRect: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1) { () -> Void in
           // self.transformRect.transform = CGAffineTransformMakeScale(2, 2)
           //self.transformRect.transform = CGAffineTransformMakeRotation(45)
        }
        
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            //self.transformRect.transform = CGAffineTransformMakeRotation(135)
            
            self.transformRect.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(2, 2), CGAffineTransformMakeRotation(45))
            
            }, completion: nil)
        
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
