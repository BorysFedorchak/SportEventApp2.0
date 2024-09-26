//
//  UserCD+CoreDataProperties.swift
//  SportEventApp2.0
//
//  Created by borys on 19.09.2024.
//
//

import Foundation
import CoreData

@objc(UserCD)
public class UserCD: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCD> {
        return NSFetchRequest<UserCD>(entityName: "UserCD")
    }

    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var id: UUID?

}

extension UserCD : Identifiable {

}
