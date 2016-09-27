//
//  ViewController.swift
//  SOSocialLogin
//
//  Created by Hitesh on 9/27/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    //Outlet of facebook button
    @IBOutlet weak var btnFB: UIButton!
    
    //Create object of FBSDKLoginManager
    let loginManager: FBSDKLoginManager = FBSDKLoginManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FIXME: -
        //Add your "FacebookAppID" and "URL Schemes" in info.plist
    }

    //Action on facebook button
    @IBAction func actionFB(sender: AnyObject) {
        //Check FB session validation
        if FBSDKAccessToken.currentAccessToken() == nil {
            //Facebook Session is not active
            //Facebook Login
            //Take default permissions("public_profile","email","user_friends")
            loginManager.logInWithReadPermissions(["public_profile","email","user_friends"], fromViewController: self, handler: { (result:FBSDKLoginManagerLoginResult!, error:NSError!) -> Void in
                if error != nil {
                    //error
                } else if result.isCancelled {
                    //Login process cancelled by user
                } else {
                    //Successfully loggedIn
                    self.btnFB.titleLabel?.text = "Facebook Logout"
                }
            })
        } else {
            //Facebook session is active
            //Facebook Logout
            loginManager.logOut()
            self.btnFB.titleLabel?.text = "Facebook Login"
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

