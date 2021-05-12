//
//  AdministratorViewController.swift
//  Project01-ResortSurvey
//
//  Created by Lam Nguyen on 4/29/21.
//

import UIKit

/*
 
 To use the administrator functions use the following credentials on the Login Screen:
    // Username: admin
    // Password: admin
 */

class AdministratorViewController: UIViewController {

    @IBOutlet weak var categoryInput: UITextField!
    @IBOutlet weak var idCategoryInput: UITextField!
    @IBOutlet weak var questionInput: UITextField!
    @IBOutlet weak var ratingInput: UITextField!
    @IBOutlet weak var deleteInput: UITextField!
    @IBOutlet weak var questionsByCategory: UITextField!
    @IBOutlet weak var deleteUserInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // Set Autorotation to false
    override open var shouldAutorotate: Bool {
        return false
    }
    
    // Specify the supported Orientation
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    // Press Button to add a Question to Persistent Storage
    @IBAction func addQuestion(_ sender: Any) {
        
        let dic = ["category" : categoryInput.text,
            "idCategory" : idCategoryInput.text,
            "question" : questionInput.text,
            "rating" : ratingInput.text
        ]
        
        QuestionsHelper.inst.addData(object: dic as! [String:String])
        
        categoryInput.text = ""
        idCategoryInput.text = ""
        questionInput.text = ""
        ratingInput.text = ""
    }
  
    // Press Button to view all the survey questions in the console.
    // Questions are sorted by the attribute "idCategory" in descending order
    @IBAction func viewAllQuestions(_ sender: Any) {
        let data = QuestionsHelper.inst.getData()
        
        print("Number of Questions: \(data.count)")
        
        for questions in data{
            print("ID:",questions.idCategory!, "\nCategory:", questions.category!,
                "\nQuestion:", questions.question!,
                "\nRating:",questions.rating!,
                "\n"
            )
        }
    }
    
    // Delete a question by entering it's unique id available in the attribute "idCategory"
    // To get the unique id for a question, press the viewAllQuestions button to see all the available questions in the console
    @IBAction func deleteQuestion(_ sender: Any) {
        QuestionsHelper.inst.deleteData(idCategory: deleteInput.text!)
        deleteInput.text = ""
        
    }
    
    // View all the questions available for a particular category of Survey questions pertaining to the resort.
    // The 5 categories of resort questions are: Food, Gym, Spa, Room, and Overall
    @IBAction func questionsByCategory(_ sender: Any) {
        let data = QuestionsHelper.inst.getCategory(category: questionsByCategory.text! )
        
        for questions in data{
            print("ID:", questions.idCategory!,
                  "\nRating:", questions.rating!,
                "\nCategory:", questions.category!,
                "\nQuestion:", questions.question!,
                "\n"
            )
        }
        questionsByCategory.text = ""
    }
    
    // View all user accounts created on this device:
    @IBAction func viewUsers(_ sender: Any) {
        let data = LoginHelper.inst.getData()
        
        print("Number of users: \(data.count)")
        
        for users in data {
            print("Username: \(users.username!) ")
        }
    }
    
    // Delete User:
    @IBAction func deleteUser(_ sender: Any) {
        LoginHelper.inst.deleteData(username: deleteUserInput.text!)
        deleteUserInput.text = ""
    }
    
    @IBAction func back(_ sender: Any) {
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        // This instantiates or shows the storyboard object/view controller that you want to show once you log in.
        let log = sb.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        
        // Function which belongs to UIviewController. If this isn't called, the next screen will not show up.
        // This shows the screen once you log on.
        self.present(log, animated: true, completion: nil)    }
    
    
    
    
    
    
}
