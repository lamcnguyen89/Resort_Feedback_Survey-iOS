//
//  ForgotPasswordViewController.swift
//  Project01-ResortSurvey
//
//  Created by Lam Nguyen on 4/28/21.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var outputDisplay: UILabel!
    @IBOutlet weak var getPasswordButton: MyButtons!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPasswordButton.layer.cornerRadius = 8        
    }
    
    // Set Autorotation to false
    override open var shouldAutorotate: Bool {
        return false
    }
    
    // Specify the supported Orientation
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @IBAction func retrievePassword(_ sender: Any) {
        
        let userId = username.text!
        let em = email.text!
        
        let data = LoginHelper.inst.getOneData(username: userId)
        
        if LoginHelper.found == 1 {
        
            if( data.username != nil && data.email! == em ) {
                
                outputDisplay.text = "Your password: \(data.password ?? "None")"

            } else {
                print("Wrong email. Try again.")
                email.text = ""
                outputDisplay.text = "Wrong email. Try again."
            }
        } else {
            print("Wrong Username. Try again.")
            username.text = ""
            email.text = ""
            outputDisplay.text = "Wrong Username. Try again."
        
        }
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
