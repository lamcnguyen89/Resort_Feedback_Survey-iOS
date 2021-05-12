//
//  LoginViewController.swift
//  Project01-ResortSurvey
//
//  Created by Lam Nguyen on 4/28/21.
//

import UIKit

class LoginViewController: UIViewController {

    var ud = UserDefaults.standard


    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var displayOutput: UILabel!
    @IBOutlet weak var signIn: MyButtons!
    @IBOutlet weak var signUp: MyButtons!
    @IBOutlet weak var getPassword: MyButtons!
    @IBOutlet weak var outputLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.lineBreakMode = .byWordWrapping
        outputLabel.numberOfLines = 0
        signIn.layer.cornerRadius = 8
        signUp.layer.cornerRadius = 8
        getPassword.layer.cornerRadius = 8
        
        username.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        password.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        // Do any additional setup after loading the view.
    }
    
    // Set Autorotation to false
    override open var shouldAutorotate: Bool {
        return false
    }
    
    // Specify the supported Orientation
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    @IBAction func logIn(_ sender: Any) {
        let userId = username.text!
        let pw = password.text!
        
        let data = LoginHelper.inst.getOneData(username: userId)
        
        // Go to the administrator View
        if (userId == "admin" && pw == "admin") {
            let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let wel = sb.instantiateViewController(withIdentifier: "Administrator") as! AdministratorViewController
            self.present(wel, animated: true, completion: nil)
            
        }
        
        if LoginHelper.found == 1 {
        
        if( data.username != nil && data.password! == pw ) {
            
            UserDefaults.standard.setValue(0, forKey: "questionTracker")
            // Choose the storyboard that you are using
            // Bundle: nil, extra information that passes to the storyboard
            let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            // This instantiates or shows the storyboard object/view controller that you want to show once you log in.
            let wel = sb.instantiateViewController(withIdentifier: "Welcome") as! WelcomeViewController
            
            // Function which belongs to UIviewController. If this isn't called, the next screen will not show up.
            // This shows the screen once you log on.
            self.present(wel, animated: true, completion: nil)
        } else {
            print("Wrong password. Try again.")
            password.text = ""
            displayOutput.text = "Wrong password. Try again."
            
        }
    } else {
        print("Wrong Username. Try again.")
        username.text = ""
        password.text = ""
        displayOutput.text = "Wrong Username. Try again."
        
        }
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        // Choose the storyboard that you are using
        // Bundle: nil, extra information that passes to the storyboard
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        // This instantiates or shows the storyboard object/view controller that you want to show once you log in.
        let wel = sb.instantiateViewController(withIdentifier: "CreateAccount") as! CreateUserViewController
        
        // Function which belongs to UIviewController. If this isn't called, the next screen will not show up.
        // This shows the screen once you log on.
        self.present(wel, animated: true, completion: nil)
    }
    
    @IBAction func getPassword(_ sender: Any) {
        // Choose the storyboard that you are using
        // Bundle: nil, extra information that passes to the storyboard
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        // This instantiates or shows the storyboard object/view controller that you want to show once you log in.
        let wel = sb.instantiateViewController(withIdentifier: "ForgotPassword") as! ForgotPasswordViewController
        
        // Function which belongs to UIviewController. If this isn't called, the next screen will not show up.
        // This shows the screen once you log on.
        self.present(wel, animated: true, completion: nil)    }
    
    
    
    
}
