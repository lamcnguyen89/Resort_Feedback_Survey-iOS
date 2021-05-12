//
//  DBHelper.swift
//  Project01-ResortSurvey
//
//  Created by Lam Nguyen on 4/28/21.
//

import Foundation
import CoreData
import UIKit

class LoginHelper {
    
    static var inst = LoginHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func addData(object : [String:String]){
        let user = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context!) as! Users
        user.username = object["username"]
        user.password = object["password"]
        user.email = object["email"]
        
        do{
            try context?.save()
            print("New User Created")
        }
        catch{
            print("Failed to Create New User")
        }
        
    }
    
    func getData()-> [Users]{
        var us = [Users]()
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        do{
            us = try context?.fetch(fetchReq) as! [Users]
        }
        catch{
            print("can not fetch any data")
        }
        return us
        
    }
    
    static var found = 0
    
    func getOneData (username : String)-> Users{
        
        var us = Users()
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        
        fetchReq.fetchLimit = 1
        do {
            let req = try context?.fetch(fetchReq) as! [Users]
            if(req.count != 0 ){
                us = req.first!
                
                LoginHelper.found = 1
            }
            else{
                LoginHelper.found = 0
            }
        }
        catch{
            print("")
        }
        
        return us

    }
    
    func updateData(object : [String:String]){
        
        var u = Users()
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Student")
        fetchReq.predicate = NSPredicate(format: "username == %@", object["username"]!)
        do{
            let us = try context?.fetch(fetchReq)
            
            if (us?.count != 0){
                u = us?.first as! Users
                
                u.password = object["password"]
                try context?.save()
                print("data saved")
            }
            
        }
            catch {
                print("error")
            }
        }
        
    func deleteData(username :String){
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Users")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        
        do{
            let us = try context?.fetch(fetchReq)
            context?.delete(us?.first as! Users)
            try context?.save()
            print("data deleted")
        }
        catch{
            print("Data not deleted")
        }
    }}
