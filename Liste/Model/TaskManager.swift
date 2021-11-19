//
//  TaskManager.swift
//  Liste
//
//  Created by Danilo on 18/11/21.
//

import CoreData
import UIKit

struct TaskManager {
    static let shared = TaskManager()

    let coreDataContext: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
           fatalError("")
        }

        let context = appDelegate.persistentContainer.viewContext

        return context
    }()
    
    func count() -> Int {
        let fetchRequest = NSFetchRequest<Task>(entityName: "Task")
        do { return try coreDataContext.count(for: fetchRequest)}
        catch { return 0 }
    }
    
    func create(date: Date? = nil, title: String, deliverable: Bool = false,
                priority: String? = nil, steps: String? = nil, time: Date? = nil,
                duration: Int16) -> Task? {
            let taskObject = NSEntityDescription.insertNewObject(forEntityName: "Task", into: coreDataContext)

            guard let task = taskObject as? Task else {
                fatalError("Could not find Task class")
            }
            
            task.date = date
            task.title = title
            task.deliverable = deliverable
            task.priority = priority
            task.steps = steps
            task.time = time
            task.duration = duration

            return self.save() ? task : nil
    }

    func update(id: Int, date: Date? = nil, title: String? = nil,
                deliverable: Bool? = nil, priority: String? = nil,
                steps: String? = nil, time: Date? = nil, duration: Int16? = nil) {
            if let task = getTask(by: id) {
                if let newDate = date { task.date = newDate }
                if let newTitle = title { task.title = newTitle }
                if let newDeliverable = deliverable { task.deliverable = newDeliverable }
                if let newPriority = priority { task.priority = newPriority }
                if let newDuration = duration { task.duration = newDuration }
                if let newSteps = steps { task.steps = newSteps }
                
                self.save()
            }
    }
    
    func getAll() -> [Task] {
        let fetchRequest = NSFetchRequest<Task>(entityName: "Task")
        
        do {
            let tasks = try coreDataContext.fetch(fetchRequest)
            return tasks
        } catch {
            print("Something happened try again later.")
        }

        return []
    }
    
    func getTask(by id: Int) -> Task? {
        let fetchRequest = NSFetchRequest<Task>(entityName: "Task")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)

        do {
            let tasks = try coreDataContext.fetch(fetchRequest)
            return tasks.first
        } catch {
            print("Something happened try again later.")
        }

        return nil
    }

    func delete(id: Int) -> Bool {
        if let task = getTask(by: id) {
            coreDataContext.delete(task)
            return self.save()
        }
        return false
    }
    
    func completeTask(id: Int) {
        if let task = getTask(by: id) {
            task.complete = true
            self.save()
        }
    }
    
    func save() -> Bool {
        do {
            try coreDataContext.save()
            return true
        } catch let error {
            print("Sorry, we can't save the Task. Try again later. \n \(error)")
        }

        return false
    }
}
