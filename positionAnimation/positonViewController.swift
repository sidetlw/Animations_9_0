//
//  positonViewController.swift
//  positionAnimation
//
//  Created by test on 10/27/15.
//  Copyright © 2015 Mrtang. All rights reserved.
//

import UIKit

class positonViewController: UIViewController {

    @IBOutlet weak var yellowRect: UIView!
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
            self.yellowRect.center.x = self.view.bounds.size.width - self.yellowRect.center.x
            self.yellowRect.center.y = self.view.bounds.size.height - self.yellowRect.center.y

        }
        
        UIView.animateWithDuration(1, delay: 0.3, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
           // self.yellowRect.center.x = self.view.bounds.size.width - self.yellowRect.center.x

            }, completion: nil)
        
        UIView.animateWithDuration(1, delay: 0.3, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
           // self.yellowRect.center.x = self.view.bounds.size.width / 2
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
