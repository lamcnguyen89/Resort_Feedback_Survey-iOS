//
//  CreateUserViewController.swift
//  Project01-ResortSurvey
//
//  Created by Lam Nguyen on 4/28/21.
//

import UIKit

class CreateUserViewController: UIViewController {

    // var ud = UserDefaults.standard
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var createButton: MyButtons!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButton.layer.cornerRadius = 8

    }
    
    // Set Autorotation to false
    override open var shouldAutorotate: Bool {
        return false
    }
    
    // Specify the supported Orientation
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @IBAction func signUp(_ sender: Any) {
        

        
        let dic = ["email" : email.text , "password" : password.text , "username" : username.text  ]
        
        LoginHelper.inst.addData(object: dic as! [String:String])
        
        if username.text != nil && password.text != nil && email.text != nil {
            let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            // This instantiates or shows the storyboard object/view controller that you want to show once you log in.
            let log = sb.instantiateViewController(withIdentifier: "Login") as! LoginViewController
            
            // Function which belongs to UIviewController. If this isn't called, the next screen will not show up.
            // This shows the screen once you log on.
            self.present(log, animated: true, completion: nil)
            
        }
        
        username.text = ""
        password.text = ""
        email.text = ""
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        // This instantiates or shows the storyboard object/view controller that you want to show once you log in.
        let log = sb.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        
        // Function which belongs to UIviewController. If this isn't called, the next screen will not show up.
        // This shows the screen once you log on.
        self.present(log, animated: true, completion: nil)
    }
    
}
