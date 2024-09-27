//
//  RealmService.swift
//  SportEventApp2.0
//
//  Created by borys on 27.09.2024.
//

//import Foundation
//import RealmSwift
//import UIKit
//
//// MARK: - Моделі Realm
//
//// MARK: User
//class User: Object {
//    @Persisted(primaryKey: true) var id: UUID = UUID()
//    @Persisted var name: String = ""
//    @Persisted var email: String = ""
//    @Persisted var password: String = ""
//}
//
//// MARK: SportEvent
//class SportEvent: Object {
//    @Persisted(primaryKey: true) var id: UUID = UUID()
//    @Persisted var name: String = ""
//    @Persisted var descriptionn: String = ""
//    @Persisted var date: Date = Date()
//    @Persisted var images = List<EventImage>()
//}
//
//// MARK: EventImage
//class EventImage: Object {
//    @Persisted(primaryKey: true) var id: UUID = UUID()
//    @Persisted var imageData: Data = Data()
//    @Persisted(originProperty: "images") var sportEvent: LinkingObjects<SportEvent>
//}
//
//// MARK: - RealmService
//
//class RealmService {
//    
//    // Singleton для глобального доступу
//    static let shared = RealmService()
//    
//    private var realm: Realm
//    
//    private init() {
//        // Ініціалізація Realm
//        do {
//            realm = try Realm()
//        } catch let error as NSError {
//            fatalError("Помилка ініціалізації Realm: \(error.localizedDescription)")
//        }
//    }
//    
//    // MARK: - User
//    
//    func removeUser(_ user: User) {
//        do {
//            try realm.write {
//                realm.delete(user)
//            }
//        } catch {
//            print("Не вдалося видалити користувача: \(error)")
//        }
//    }
//    
//    func saveNewUser(name: String, email: String, password: String) {
//        // Перевірка на пусті поля
//        guard !name.isEmpty, !email.isEmpty, !password.isEmpty else {
//            print("Будь ласка, заповніть всі поля.")
//            return
//        }
//        
//        // Перевірка на існування користувача
//        if userExistsEmail(withEmail: email) {
//            print("Користувач з таким email вже існує")
//            return
//        }
//        
//        if userExistsName(withName: name) {
//            print("Користувач з таким ім'ям вже існує")
//            return
//        }
//        
//        let user = User()
//        user.name = name
//        user.email = email
//        user.password = password
//        
//        do {
//            try realm.write {
//                realm.add(user)
//            }
//        } catch {
//            print("Не вдалося зберегти користувача: \(error)")
//        }
//    }
//    
//    func userExistsName(withName name: String) -> Bool {
//        return realm.objects(User.self).filter("name == %@", name).count > 0
//    }
//    
//    func userExistsEmail(withEmail email: String) -> Bool {
//        return realm.objects(User.self).filter("email == %@", email).count > 0
//    }
//    
//    func getUsers() -> Results<User> {
//        return realm.objects(User.self)
//    }
//    
//    func loginUser(identifier: String, password: String) -> Bool {
//        let users = realm.objects(User.self).filter("(email == %@ OR name == %@) AND password == %@", identifier, identifier, password)
//        return users.count > 0
//    }
//    
//    func authenticateUser(withNameOrEmail nameOrEmail: String, andPassword password: String) -> User? {
//        return realm.objects(User.self).filter("(name == %@ OR email == %@) AND password == %@", nameOrEmail, nameOrEmail, password).first
//    }
//    
//    // MARK: - SportEvent
//    
//    func removeEvent(_ event: SportEvent) {
//        do {
//            try realm.write {
//                realm.delete(event)
//            }
//        } catch {
//            print("Не вдалося видалити подію: \(error)")
//        }
//    }
//    
//    func saveNewEvent(name: String, descriptionn: String, date: Date, images: [Data]) {
//        let event = SportEvent()
//        event.name = name
//        event.descriptionn = descriptionn
//        event.date = date
//        
//        let eventImages = images.map { imageData -> EventImage in
//            let image = EventImage()
//            image.imageData = imageData
//            return image
//        }
//        
//        do {
//            try realm.write {
//                event.images.append(objectsIn: eventImages)
//                realm.add(event)
//            }
//        } catch {
//            print("Не вдалося зберегти подію: \(error)")
//        }
//    }
//    
//    func getEvents() -> Results<SportEvent> {
//        return realm.objects(SportEvent.self)
//    }
//    
//    // MARK: - EventImage
//    
//    func getImages(for event: SportEvent) -> [Data] {
//        return event.images.map { $0.imageData }
//    }
//}
