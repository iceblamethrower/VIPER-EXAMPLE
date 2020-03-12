//
//  CoreDataEngine.swift
//  VIPER SIMPLE
//
//  Created by Roman Gorshkov on 02.03.2020.
//  Copyright © 2020 Roman Gorshkov. All rights reserved.
//

import Foundation
import CoreData

class CoreDataEngine {
    
    var moc = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType
        .mainQueueConcurrencyType)
    
    static var sharedInstance = CoreDataEngine()
    
    init() {
        moc = CoreDataManager.sharedInstance.persistentContainer.viewContext
    }
    
    func createUser(userModel: UserModel) -> Bool {
        let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: moc)
        let user = User(entity: entityDescription!, insertInto: moc)
        user.setValue(userModel.userName, forKey: "name")
        user.setValue(userModel.password, forKey: "password")
        do {
            try moc.save()
            print("core data - user saved")
            return true
        } catch {
            let nserror = error as NSError
            NSLog("\(nserror)")
            return false
        }
       
    }
    
    func checkUser() -> Bool {
        let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: moc)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = entityDescription
        
        do {
            let result = try moc.fetch(fetchRequest)
            if result.count == 0 {
                print("\n core data - data empty values")
                return false
            } else {
                return true
            }
        } catch {
            let nserror = error as NSError
            NSLog("\(nserror)")
            return false
        }
    }
    
    func loginUser(userModel: UserModel) -> Bool {
        let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: moc)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.predicate = NSPredicate(format: "%K = %@", "name", userModel.userName)
        fetchRequest.entity = entityDescription
        
        do {
            let result = try moc.fetch(fetchRequest)
            if (result.count == 1) {
                return true
            } else {
                return false
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return false
    }
    
    func deleteUsers() {
        let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: moc)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = entityDescription
        
        do {
            let result = try moc.fetch(fetchRequest)
            if (result.count == 0) {
                print("There's no users!")
                return
            }
            for managedObject in result {
                moc.delete(managedObject as! User)
            }
            try moc.save()
            print("user deleted!")
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
}
