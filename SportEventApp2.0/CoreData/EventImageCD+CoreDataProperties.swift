//
//  EventImageCD+CoreDataProperties.swift
//  SportEventApp2.0
//
//  Created by borys on 23.09.2024.
//
//

import Foundation
import CoreData

@objc(EventImageCD)
public class EventImageCD: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventImageCD> {
        return NSFetchRequest<EventImageCD>(entityName: "EventImageCD")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var image: Data?
    @NSManaged public var relationship: SportEventCD?

}

extension EventImageCD : Identifiable {

}
