//
//  WelcomeViewController.swift
//  Project01-ResortSurvey
//
//  Created by Lam Nguyen on 4/28/21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var surveyButtonText: UIButton!
    
    var ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // surveyButtonText.layer.cornerRadius = 8
        // Format the offers label:
        outputLabel.lineBreakMode = .byWordWrapping
        outputLabel.numberOfLines = 0

        displayOffers()
        
    }
    
    @IBAction func startSurvey(_ sender: Any) {
        
        ud.set(0, forKey: "questionTracker")
       
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let wel = sb.instantiateViewController(withIdentifier: "Room") as! RoomViewController
        self.present(wel, animated: true, completion: nil)
        
    }
    
 
    func displayOffers() {
        
        let numberOfQuestions = QuestionsHelper.inst.getData().count
        
        
        if(ud.integer(forKey: "questionTracker") >= numberOfQuestions) {
            
            outputLabel.text = "Thank you for your feedback!! Your feedback is crucial for improving our ability to serve you and others."
            surveyButtonText.setTitle("Redo Survey", for: .normal)
            
        } else {
            outputLabel.text = "Help us improve our service to you and others by giving your feedback to these Questions!"
        }
    
    }
    
}
