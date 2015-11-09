//
//  easeViewController.swift
//  positionAnimation
//
//  Created by test on 10/28/15.
//  Copyright © 2015 Mrtang. All rights reserved.
//

import UIKit

class easeViewController: UIViewController {

    @IBOutlet weak var easeInOutRect: UIView!
    @IBOutlet weak var easeOutRect: UIView!
    @IBOutlet weak var easeInRect: UIView!
    @IBOutlet weak var lineRect: UIView!
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
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.lineRect.center.x = self.view.bounds.width - self.lineRect.center.x
            
            }, completion: nil)
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.easeInRect.center.x = self.view.bounds.width - self.easeInRect.center.x
            
            }, completion: nil)
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.easeOutRect.center.x = self.view.bounds.width - self.easeOutRect.center.x
            
            }, completion: nil)
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.easeInOutRect.center.x = self.view.bounds.width - self.easeInOutRect.center.x
            
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
