//
//  GymViewController.swift
//  Project01-ResortSurvey
//
//  Created by Lam Nguyen on 4/28/21.
//

import UIKit

// Fetch all the questions from peristent storage and add it to an object.

// I want to loop through each of the questions and add a label and use the cosmos thing to make the stars for each of the questions using code and not the storyboard.


class GymViewController: UIViewController {
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var q1: UILabel!
    @IBOutlet weak var q2: UILabel!
    @IBOutlet weak var q3: UILabel!
    @IBOutlet weak var q4: UILabel!
    @IBOutlet weak var q5: UILabel!
    @IBOutlet weak var q1Rating: CosmosView!
    @IBOutlet weak var q2Rating: CosmosView!
    @IBOutlet weak var q3Rating: CosmosView!
    @IBOutlet weak var q4Rating: CosmosView!
    @IBOutlet weak var q5Rating: CosmosView!
    @IBOutlet weak var q1Img: UIImageView!
    @IBOutlet weak var q2Img: UIImageView!
    @IBOutlet weak var q3Img: UIImageView!
    @IBOutlet weak var q4Img: UIImageView!
    @IBOutlet weak var q5Img: UIImageView!
    @IBOutlet weak var headingImg: UIImageView!
    
    var questionTracker = 0
    
    override func viewDidLoad() {

        super.viewDidLoad()
        surveyProgress()
        loadQuestions()
        saveRatings()
        print("Number of Gym Questions",QuestionsHelper.inst.getCategory(category: "Gym" ).count)
        
    }
    
    // Set Autorotation to false
    override open var shouldAutorotate: Bool {
        return false
    }
    
    // Specify the supported Orientation
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @IBAction func submitFeedback(_ sender: Any) {

        // Make sure that questions aren't tracked multiple times
        let questionsPerCategory = QuestionsHelper.inst.getCategory(category: "Gym" ).count
        
        if self.questionTracker > questionsPerCategory {
            self.questionTracker = questionsPerCategory
        }
        
        let ud = UserDefaults.standard
        ud.set(ud.integer(forKey: "questionTracker") + self.questionTracker, forKey: "questionTracker")
        
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let wel = sb.instantiateViewController(withIdentifier: "Spa") as! SpaViewController
        self.present(wel, animated: true, completion: nil)
    }
    
    func surveyProgress() {
        // Get number of questions answered so far:
        let questionsAnswered = UserDefaults.standard.integer(forKey: "questionTracker")
        
        // Get total number of questions in database:
        let totalQuestions = QuestionsHelper.inst.getData().count
        
        progressLabel.text = "Questions Answered: \(questionsAnswered) of \(totalQuestions)"
        
    }
    
    
    func loadQuestions() {
        let data = QuestionsHelper.inst.getCategory(category: "Gym" )
        
        // Load Questions
        q1.text = data[0].question
        q2.text = data[1].question
        q3.text = data[2].question
        q4.text = data[3].question
        q5.text = data[4].question
        
        // Load default ratings
        q1Rating.rating = Double(data[0].rating!) ?? 1
        q2Rating.rating = Double(data[1].rating!) ?? 1
        q3Rating.rating = Double(data[2].rating!) ?? 1
        q4Rating.rating = Double(data[3].rating!) ?? 1
        q5Rating.rating = Double(data[4].rating!) ?? 1
    }
    
    func saveRatings() {
        let data = QuestionsHelper.inst.getCategory(category: "Gym" )
        
        let question1Id = data[0].idCategory!
        let question2Id = data[1].idCategory!
        let question3Id = data[2].idCategory!
        let question4Id = data[3].idCategory!
        let question5Id = data[4].idCategory!
        
        q1Rating.didFinishTouchingCosmos = {
            rate in
            print(rate)
            self.q1Img.image = UIImage(named: "Checkmark")!
            let dic = ["idCategory": question1Id, "rating": String(rate)]
            QuestionsHelper.inst.updateData(object: dic )
            self.questionTracker += 1
        }
        q2Rating.didFinishTouchingCosmos = {
            rate in
            print(rate)
            self.q2Img.image = UIImage(named: "Checkmark")!
            let dic = ["idCategory": question2Id, "rating": String(rate)]
            QuestionsHelper.inst.updateData(object: dic )
            self.questionTracker += 1
        }
        q3Rating.didFinishTouchingCosmos = {
            rate in
            print(rate)
            self.q3Img.image = UIImage(named: "Checkmark")!
            let dic = ["idCategory": question3Id, "rating": String(rate)]
            QuestionsHelper.inst.updateData(object: dic )
            self.questionTracker += 1
        }
        q4Rating.didFinishTouchingCosmos = {
            rate in
            print(rate)
            self.q4Img.image = UIImage(named: "Checkmark")!
            let dic = ["idCategory": question4Id, "rating": String(rate)]
            QuestionsHelper.inst.updateData(object: dic )
            self.questionTracker += 1
        }
        q5Rating.didFinishTouchingCosmos = {
            rate in
            print(rate)
            self.q5Img.image = UIImage(named: "Checkmark")!
            let dic = ["idCategory": question5Id, "rating": String(rate)]
            QuestionsHelper.inst.updateData(object: dic )
            self.questionTracker += 1
        }}
    



}
