//
//  SportEventCD+CoreDataProperties.swift
//  SportEventApp2.0
//
//  Created by borys on 23.09.2024.
//
//

import Foundation
import CoreData

@objc(SportEventCD)
public class SportEventCD: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<SportEventCD> {
        return NSFetchRequest<SportEventCD>(entityName: "SportEventCD")
    }

    @NSManaged public var date: Date?
    @NSManaged public var descriptionn: String?
    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var images: NSSet?

}

// MARK: Generated accessors for images
extension SportEventCD {

    @objc(addImagesObject:)
    @NSManaged public func addToImages(_ value: EventImageCD)

    @objc(removeImagesObject:)
    @NSManaged public func removeFromImages(_ value: EventImageCD)

    @objc(addImages:)
    @NSManaged public func addToImages(_ values: NSSet)

    @objc(removeImages:)
    @NSManaged public func removeFromImages(_ values: NSSet)

}

extension SportEventCD : Identifiable {

}
