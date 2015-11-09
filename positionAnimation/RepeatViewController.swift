
//
//  RepeatViewController.swift
//  positionAnimation
//
//  Created by test on 10/28/15.
//  Copyright © 2015 Mrtang. All rights reserved.
//

import UIKit

class RepeatViewController: UIViewController {

    @IBOutlet weak var orangeRect: UIView!
    @IBOutlet weak var greenRect: UIView!
    @IBOutlet weak var yellowRect: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func move() {
        UIView.animateWithDuration(1.0, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.greenRect.center.x = self.view.bounds.width - self.greenRect.center.x
            }, completion: { (_) -> Void in
                self.move()
            }
        )

    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1) { () -> Void in
            self.yellowRect.center.x = self.view.bounds.width - self.yellowRect.center.x
        }
        
        move()
        
        UIView.animateWithDuration(1.0, delay: 0, options: UIViewAnimationOptions.Repeat , animations: { () -> Void in
            self.orangeRect.center.x = self.view.bounds.width - self.orangeRect.center.x

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
