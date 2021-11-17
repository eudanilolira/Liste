//
//  User.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import CoreData
import UIKit

struct UserManager {
    static let shared = UserManager()

    let coreDataContext: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
           fatalError("")
        }

        let context = appDelegate.persistentContainer.viewContext

        return context
    }()
    
    func count() -> Int {
        let fetchRequest = NSFetchRequest<User>(entityName: "User")

        do { return try coreDataContext.count(for: fetchRequest)}
        catch { return 0 }
    }
    
    func create(sleep: Int16?, work: Int16?, fun: Int16?, sports: Int16?, study: Int16?) -> User? {
        guard let createdUser = self.getUser() else {
            let userObject = NSEntityDescription.insertNewObject(forEntityName: "User", into: coreDataContext)

            guard let user =  userObject as? User else {
                fatalError("Could not find User class")
            }
            
            user.work = work ?? -1
            user.fun = fun ?? -1
            user.sports = sports ?? -1
            user.sleep = sleep ?? -1
            user.school = study ?? -1

            return self.save() ? user : nil
        }
        
        if let intWork = work {
            createdUser.work = intWork
        }
        
        if let intFun = fun {
            createdUser.fun = intFun
        }
        
        if let intSports = sports {
            createdUser.sports = intSports
        }
        
        if let intSleep = sleep {
            createdUser.sleep = intSleep
        }
        
        if let intStudy = study {
            createdUser.school = intStudy
        }
        
        return self.save() ? createdUser : nil
    }

    func getUser() -> User? {
        let fetchRequest = NSFetchRequest<User>(entityName: "User")

        do {
            let users = try coreDataContext.fetch(fetchRequest)
            return users.first
        } catch {
            print("Something happened try again later.")
        }

        return nil
    }

    func delete(name: String) -> Bool {
        let fetchRequest = NSFetchRequest<User>(entityName: "User")

        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)

        do {
            let User = try coreDataContext.fetch(fetchRequest)

            if !User.isEmpty {
                coreDataContext.delete(User[0])
                return self.save()
            } else {
                print("This User could not be found")
            }

        } catch {
            print("Error")
        }

        return false
    }

    func save() -> Bool {
        do {
            try coreDataContext.save()
            return true
        } catch let error {
            print("Sorry, we can't save the User. Try again later. \n \(error)")
        }

        return false
    }
}
