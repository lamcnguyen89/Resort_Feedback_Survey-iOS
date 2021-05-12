//
//  Questions+CoreDataProperties.swift
//  Project01-ResortSurvey
//
//  Created by Lam Nguyen on 4/30/21.
//
//

import Foundation
import CoreData


extension Questions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Questions> {
        return NSFetchRequest<Questions>(entityName: "Questions")
    }

    @NSManaged public var idCategory: String?
    @NSManaged public var question: String?
    @NSManaged public var rating: String?
    @NSManaged public var category: String?

}

extension Questions : Identifiable {

}
