
//
//  CoreDataManager.swift
//  NearCatch
//
//  Created by Tempnixk on 2022/06/11.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    static let coreDM = CoreDataManager()

    let persistentContainer: NSPersistentContainer

    init() {
        persistentContainer = NSPersistentContainer(name:"NearCatch")
        persistentContainer.loadPersistentStores {(description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }


    func createProfile(nickname: String) {

        let profile = Profile(context: persistentContainer.viewContext)
        profile.nickname = nickname


        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save profile \(error)")
        }
    }
    
    func createPicture(content: UIImage) {

        let picture = Picture(context: persistentContainer.viewContext)
        picture.content = content


        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save profile \(error)")
        }
    }
    
    func createKeyword(favorite: [Int]){
        
        let keyword = Keyword(context: persistentContainer.viewContext)
        keyword.favorite = favorite
        
        do{
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save profile \(error)")
        }
        
    }
    

    func readAllProfile() -> [Profile] {

        let fetchRequest: NSFetchRequest<Profile> = Profile.fetchRequest()

        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }

    }
    func readAllPicture() -> [Picture] {
        
        let fetchRequest: NSFetchRequest<Picture> = Picture.fetchRequest()

        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }

    }

    func readKeyword() -> [Keyword] {
        let fetchRequest: NSFetchRequest<Keyword> = Keyword.fetchRequest()
        
        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    
    func updateProfile() {

        do{
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
    }

    func deleteProfile(profile: Profile) {

        persistentContainer.viewContext.delete(profile)

        do{
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }
    }
}

