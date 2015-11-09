//
//  LoginLayoutViewController.swift
//  positionAnimation
//
//  Created by test on 10/31/15.
//  Copyright © 2015 Mrtang. All rights reserved.
//

import UIKit

class LoginLayoutViewController: UIViewController {
    
    var effectType:String?

    @IBOutlet weak var loginXconstaint: NSLayoutConstraint!
    @IBOutlet weak var dotXconstaint: NSLayoutConstraint!
    @IBOutlet weak var animatehubXconstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordXconstaint: NSLayoutConstraint!
    @IBOutlet weak var loginYconstraint: NSLayoutConstraint!
    @IBOutlet weak var usernameXconstraint: NSLayoutConstraint!
    @IBOutlet weak var loginWidthConstraint: NSLayoutConstraint!

    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var dot: UIImageView!
    @IBOutlet weak var animatehub: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var pao5: UIImageView!
    @IBOutlet weak var pao4: UIImageView!
    @IBOutlet weak var pao3: UIImageView!
    @IBOutlet weak var pao2: UIImageView!
    @IBOutlet weak var pao1: UIImageView!
    var warningImage:UIImageView?
    
    
    var centerXconstraint:CGFloat = 0.0
    var spinning = UIActivityIndicatorView()
    var loginButtonPos = CGPointZero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.centerXconstraint = animatehubXconstraint.constant

        // Do any additional setup after loading the view.
        self.pao1.transform = CGAffineTransformMakeScale(0, 0)
       
        self.pao2.transform = CGAffineTransformMakeScale(0, 0)
        self.pao3.transform = CGAffineTransformMakeScale(0, 0)
        self.pao4.transform = CGAffineTransformMakeScale(0, 0)
        self.pao5.transform = CGAffineTransformMakeScale(0, 0)
        
        animatehubXconstraint.constant -= self.view.frame.size.width
        dotXconstaint.constant -= self.view.frame.size.width / 2
        
        self.usernameXconstraint.constant -= self.view.frame.size.width
        self.passwordXconstaint.constant -= self.view.frame.size.width
        self.loginXconstaint.constant -= self.view.frame.size.width
        
        self.usernameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: self.usernameTextField.frame.height))
        self.usernameTextField.leftViewMode = UITextFieldViewMode.Always
        
        self.passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: self.passwordTextField.frame.height))
        self.passwordTextField.leftViewMode = UITextFieldViewMode.Always
        
        let userimage = UIImage(named: "User")
        let userimageView = UIImageView(image: userimage)
        self.usernameTextField.addSubview(userimageView)
        userimageView.frame.origin = CGPointMake(12, 10)
        
        let keyimage = UIImage(named: "Key")
        let keyimageView = UIImageView(image: keyimage)
        self.passwordTextField.addSubview(keyimageView)
        keyimageView.frame.origin = CGPointMake(12, 10)
        
        self.loginButton.addSubview(self.spinning)
        self.spinning.frame.origin = CGPointMake(40, 30)
        self.spinning.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        
        
        
      

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.3) { () -> Void in
            self.pao1.transform = CGAffineTransformMakeScale(1, 1)
            self.pao2.transform = CGAffineTransformMakeScale(1, 1)
            self.pao3.transform = CGAffineTransformMakeScale(1, 1)
            self.pao4.transform = CGAffineTransformMakeScale(1, 1)
            self.pao5.transform = CGAffineTransformMakeScale(1, 1)
        }
    
        animatehubXconstraint.constant = self.centerXconstraint
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        dotXconstaint.constant = self.centerXconstraint - 70.5
        UIView.animateWithDuration(3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        self.usernameXconstraint.constant = self.centerXconstraint
        UIView.animateWithDuration(0.5, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        self.passwordXconstaint.constant = self.centerXconstraint
        UIView.animateWithDuration(0.5, delay: 0.6, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        self.loginXconstaint.constant = self.centerXconstraint
        UIView.animateWithDuration(0.5, delay: 0.7, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.view.layoutIfNeeded()
            }, completion: {
                _ in
        })
        
        loginButtonPos = self.loginButton.center
        
        let wImage = UIImage(named: "Warning")
        self.warningImage = UIImageView(image: wImage)
        self.view.addSubview(self.warningImage!)
        self.warningImage?.frame = self.loginButton.frame
        self.warningImage?.hidden = true


    
    } //end viewDidAppear

    
    @IBAction func loginTapped(sender: AnyObject) {
        
        //self.loginButton.center.x -= 30
        if self.effectType == "effect1" {
        
        self.warningImage?.hidden = true
        self.loginWidthConstraint.constant -= 60
        self.loginYconstraint.constant = 120
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.view.layoutIfNeeded()
            }) { (_) -> Void in
                self.loginWidthConstraint.constant += 60
                UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
                    self.view.layoutIfNeeded()
                    
                    UIView.transitionWithView(self.warningImage!, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromTop, animations: { () -> Void in
                        self.warningImage?.hidden = false
                        }, completion: nil)

                    
                    }, completion: nil)
        }
        }
        else if self.effectType == "effect2" {
            
            self.loginButton.center = loginButtonPos
            self.loginButton.center.x -= 30
            self.warningImage?.hidden = true
            
            UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.spinning.startAnimating()
            self.loginButton.center.x += 30
            
            
            
            //self.view.layoutIfNeeded()
            }, completion: { (_) -> Void in
            self.spinning.stopAnimating()
            
            UIView.transitionWithView(self.warningImage!, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromTop, animations: { () -> Void in
            self.warningImage?.hidden = false
            }, completion: nil)
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.loginButton.center.y += 80
            })
            
            
            })
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
