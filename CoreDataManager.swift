//
//  CoreDataManager.swift
//  NearCatch
//
//  Created by Tempnixk on 2022/06/11.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name:"NearCatchDataModel")
        persistentContainer.loadPersistentStores {(description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }


    func createProfile(nicknameAttribute: String) {
        
        let mydata = Mydata(context: persistentContainer.viewContext)
        mydata.nicknameAttribute = nicknameAttribute
        
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save profile \(error)")
        }
    }

    func readAllProfile() -> [Mydata] {
        
        let fetchRequest: NSFetchRequest<Mydata> = Mydata.fetchRequest()
        
        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
    
    func updateMovie() {
        
        do{
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
    }
    
    func deleteProfile(mydata: Mydata) {
        
        persistentContainer.viewContext.delete(mydata)
        
        do{
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }
    }
}

