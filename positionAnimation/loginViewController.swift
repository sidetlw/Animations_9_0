//
//  loginViewController.swift
//  positionAnimation
//
//  Created by test on 10/29/15.
//  Copyright © 2015 Mrtang. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var usernameTextfiled: UITextField!
    @IBOutlet weak var pao1: UIImageView!
    @IBOutlet weak var pao5: UIImageView!
    @IBOutlet weak var pao4: UIImageView!
    @IBOutlet weak var pao3: UIImageView!
    @IBOutlet weak var pao2: UIImageView!
    @IBOutlet weak var animationhub: UIImageView!
    @IBOutlet weak var dot: UIImageView!
    let spinning = UIActivityIndicatorView()
    var loginPositon = CGPointZero
    var warningImage:UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.pao1.transform = CGAffineTransformMakeScale(0, 0)
        self.pao2.transform = CGAffineTransformMakeScale(0, 0)
        self.pao3.transform = CGAffineTransformMakeScale(0, 0)
        self.pao4.transform = CGAffineTransformMakeScale(0, 0)
        self.pao5.transform = CGAffineTransformMakeScale(0, 0)
        
        self.animationhub.center.x -= self.view.bounds.width
        self.dot.center.x -= self.view.bounds.width / 2
        
        let leftpadding = CGRect(x: 0, y: 0, width: 44, height: self.usernameTextfiled.bounds.height)
        self.usernameTextfiled.leftView = UIView(frame: leftpadding)
        self.usernameTextfiled.leftViewMode = UITextFieldViewMode.Always
        self.passwordTextfield.leftView = UIView(frame: leftpadding)
        self.passwordTextfield.leftViewMode = UITextFieldViewMode.Always

        self.passwordTextfield.center.x -= self.view.bounds.width
        self.usernameTextfiled.center.x -= self.view.bounds.width
        
        let userimage = UIImage(named: "User")
        let userimageView = UIImageView(image: userimage)
        
        let passimage = UIImage(named: "Key")
        let passimageView = UIImageView(image: passimage)
        
        self.usernameTextfiled.addSubview(userimageView)
        userimageView.frame.origin = CGPointMake(12, 10)
        
        self.passwordTextfield.addSubview(passimageView)
        passimageView.frame.origin = CGPointMake(12, 10)
        
        self.loginPositon = self.loginButton.center
        self.loginButton.center.x -= self.view.bounds.width
        

        self.spinning.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        self.loginButton.addSubview(spinning)
        self.spinning.frame.origin = CGPointMake(32, 30)

        let image = UIImage(named: "Warning")
        self.warningImage = UIImageView(image: image)
        self.view.addSubview(warningImage)
        self.warningImage.center = loginPositon
        self.warningImage.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.pao1.transform = CGAffineTransformMakeScale(1, 1)
            self.pao3.transform = CGAffineTransformMakeScale(1, 1)
            self.pao5.transform = CGAffineTransformMakeScale(1, 1)
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.pao2.transform = CGAffineTransformMakeScale(1, 1)
            self.pao4.transform = CGAffineTransformMakeScale(1, 1)

            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.3, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.animationhub.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(5, delay: 0.3, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.dot.center.x += self.view.bounds.width / 2
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.usernameTextfiled.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.4, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.passwordTextfield.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.5, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.loginButton.center.x += self.view.bounds.width

            }, completion: nil)


    }
    
    @IBAction func loginTapped(sender: AnyObject) {
        self.loginButton.center = loginPositon
        self.loginButton.center.x -= 30
        self.warningImage.hidden = true
        
        UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.spinning.startAnimating()
            self.loginButton.center.x += 30
            }) { (_) -> Void in
                UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                    self.spinning.stopAnimating()
                    self.loginButton.center.y += 80
                    
                    UIView.transitionWithView(self.warningImage, duration: 0.3, options: UIViewAnimationOptions.TransitionFlipFromTop, animations: { () -> Void in
                        self.warningImage.hidden = false
                        }, completion: nil)
                    
                    
                    }, completion: { (_) -> Void in
                        
                })
                self.spinning.stopAnimating()
                
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
