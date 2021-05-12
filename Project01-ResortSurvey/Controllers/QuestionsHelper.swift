//
//  QuestionHelper.swift
//  Project01-ResortSurvey
//
//  Created by Lam Nguyen on 4/29/21.
//

import Foundation
import CoreData
import UIKit

class QuestionsHelper {
    static var inst = QuestionsHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    // Create a new question:
    // To format the idCategory. Combine the question number with the Category
    // The id number will be 1,2,3,4, etc... which reflects the question number.
    // The category applies to the type of service that is offered by the resort. The categories are: spa, overall, food, room, gym
    func addData(object : [String:String]){
        let questions = NSEntityDescription.insertNewObject(forEntityName: "Questions", into: context!) as! Questions

        questions.category = object["category"]
        questions.idCategory = object["idCategory"]
        questions.question = object["question"]
        questions.rating = object["rating"]
        
        do{
            try context?.save()
            print("data saved")
        }catch{
            print("data not saved")
        }
    }
    
    // Fetch All Questions:
    func getData()-> [Questions]{
        var questionObj = [Questions]()
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Questions")
        fetchReq.sortDescriptors = [NSSortDescriptor(key: "idCategory", ascending: false)]
        
        do{
            questionObj = try context?.fetch(fetchReq) as! [Questions]
        }catch{
            print("can not fetch any data")
        }
        return questionObj
    }
    
    
    // Get questions by Category:
    func getCategory(category : String)-> [Questions]{
        
        var questionObj = [Questions]()
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Questions")
        fetchReq.predicate = NSPredicate(format: "category == %@", category)

        do{
            questionObj = try context?.fetch(fetchReq) as! [Questions]
        }catch{
            print("can not fetch any data")
        }
        return questionObj
    }
    
    
    
    // Retrieve a single question by the attribute named "idCategory" which serves as a unique id for each question.
    func getOneData (idCategory : String)-> Questions{
        
        var questionObj = Questions()
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Questions")
        fetchReq.predicate = NSPredicate(format: "idCategory == %@", idCategory)
        fetchReq.fetchLimit = 1
        
        do {
            let req = try context?.fetch(fetchReq) as! [Questions]
            if(req.count != 0){
                questionObj = req.first as! Questions
            }
            else{
                print("data not found")
            }
        }catch{
            print("")
        }
        return questionObj
    }
    
    
    
    // Update the rating for a question
    func updateData(object : [String:String]){
        
        var questionObj = Questions()
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Questions")
        fetchReq.predicate = NSPredicate(format: "idCategory == %@", object["idCategory"]!)
        
        do{
            let quest = try context?.fetch(fetchReq)
            
            if (quest?.count != 0){
                questionObj = quest?.first as! Questions
                
                questionObj.rating = object["rating"]
                try context?.save()
                print("data saved")
            }
            
        }catch {
            print("error")
        }
    }
    
    
    // Delete a question based on its unique id called "idCategory"
    func deleteData(idCategory :String){
        
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Questions")
        fetchReq.predicate = NSPredicate(format: "idCategory == %@", idCategory)
        fetchReq.fetchLimit = 1
        
        do{
            let qu = try context?.fetch(fetchReq)
            context?.delete(qu?.first as! Questions)
            try context?.save()
            print("data deleted")
        }
        catch{
            print("Data not deleted")
        }
    }
    
    
}
    
