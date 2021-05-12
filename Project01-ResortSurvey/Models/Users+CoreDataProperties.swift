//
//  Users+CoreDataProperties.swift
//  Project01-ResortSurvey
//
//  Created by Lam Nguyen on 4/28/21.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?

}

extension Users : Identifiable {

}
