//
//  colorViewController.swift
//  positionAnimation
//
//  Created by test on 10/28/15.
//  Copyright © 2015 Mrtang. All rights reserved.
//

import UIKit

class colorViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var orangeRect: UIView!
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
            self.orangeRect.backgroundColor = UIColor.redColor()
            self.label.textColor = UIColor.purpleColor()
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
