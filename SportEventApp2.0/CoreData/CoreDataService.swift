//
//  CoreDataService.swift
//  SportEventApp2.0
//
//  Created by borys on 18.09.2024.
//

import Foundation
import CoreData
import UIKit

class CoreDataService {
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UserCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    //MARK: - UserCD
    
    func removeUser(_ user: UserCD) {
        context.delete(user)
        saveContext()
    }
    
    func saveNewUser(name: String, email: String, password: String) {
        
        if name.isEmpty || email.isEmpty || password.isEmpty {
            print("Будь ласка, заповніть всі поля.")
        }
        
        if userExistsEmail(withEmail: email) {
            print("Користувач з таким email вже існує")
        }
        
        if userExistsName(withName: name) {
            print("Користувач з таким ім'ям вже існує")
        }
        
        let user = UserCD(context: context)
        user.name = name
        user.email = email
        user.password = password
        user.id = UUID()
        
        saveContext()
    }
    
    func userExistsName(withName name: String) -> Bool {
        let request = UserCD.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let count = try context.count(for: request)
            return count > 0
        } catch {
            return false
        }
    }
    
    func userExistsEmail(withEmail email: String) -> Bool {
        let request = UserCD.fetchRequest()
        request.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            let count = try context.count(for: request)
            return count > 0
        } catch {
            return false
        }
    }
    
    func getUsers() -> [UserCD] {
        let request = UserCD.fetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            return try context.fetch(request)
        } catch {
            return []
        }
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                context.rollback()
            }
        }
    }
    
    func loginUser(identifier: String, password: String) -> Bool {
        let request = UserCD.fetchRequest()
        
        request.predicate = NSPredicate(format: "(email == %@ OR name == %@) AND password == %@", identifier, identifier, password)
        
        do {
            let users = try context.fetch(request)
            return users.count > 0
        } catch {
            print("Помилка при спробі входу: \(error)")
            return false
        }
    }
    
    func authenticateUser(withNameOrEmail nameOrEmail: String, andPassword password: String) -> UserCD? {
        let request = UserCD.fetchRequest()
        
        let namePredicate = NSPredicate(format: "name == %@", nameOrEmail)
        let emailPredicate = NSPredicate(format: "email == %@", nameOrEmail)
        let passwordPredicate = NSPredicate(format: "password == %@", password)
        
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSCompoundPredicate(orPredicateWithSubpredicates: [namePredicate, emailPredicate]),
            passwordPredicate
        ])
        
        do {
            let users = try context.fetch(request)
            return users.first
        } catch {
            return nil
        }
    }
    
    //MARK: - EventCD
    
    func removeEvent(_ event: SportEventCD) {
        context.delete(event)
        saveContext()
    }
    
    func saveNewEvent(name: String, descriptionn: String, date: Date, images: [Data]) {
        
        let event = SportEventCD(context: context)
        event.name = name
        event.descriptionn = descriptionn
        event.date = date
        event.id = UUID()
        
        var eventImages = Set<EventImageCD>()
        
        for imageData in images {
            let eventImage = EventImageCD(context: context)
            eventImage.image = imageData
            eventImage.id = UUID()
            eventImage.relationship = event
            eventImages.insert(eventImage)
        }
        
        event.images = eventImages as NSSet
        
        saveContext()
    }
    
    func getEvents() -> [SportEventCD] {
        let request = SportEventCD.fetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            return try context.fetch(request)
        } catch {
            return []
        }
    }
    
    //MARK: - EventImageCD
    
    func getImages(for event: SportEventCD) -> [Data] {
        if let imagesSet = event.images as? Set<EventImageCD> {
            return imagesSet.compactMap { $0.image }
        }
        return []
    }

    
}

