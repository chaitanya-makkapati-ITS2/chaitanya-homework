//
//  CoreDataManager.swift
//  week6
//
//  Created by Chaitanya Makkapati on 1/27/25.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()

    let persistentContainer: NSPersistentContainer

    private init() {
        // Ensure "APIApp" matches your .xcdatamodeld filename
        persistentContainer = NSPersistentContainer(name: "APIApp")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            } else {
                print("Persistent store loaded: \(description)")
            }
        }
    }
    
    func saveEntries(_ entries: [APIEntry]) {
        let context = persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = APIEntity.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(deleteRequest)
        } catch {
            print("Failed to clear previous data: \(error)")
        }
        
        for (index, entry) in entries.enumerated() {
            let apiEntity = APIEntity(context: context)
            apiEntity.order = Int64(index)  // Make sure "order" exists in your model
            apiEntity.api = entry.api
            apiEntity.descriptionText = entry.description
            apiEntity.auth = entry.auth
            apiEntity.https = entry.https ?? false
            apiEntity.cors = entry.cors
            apiEntity.link = entry.link
            apiEntity.category = entry.category
        }
        
        do {
            try context.save()
            print("Saved \(entries.count) entries from JSON.")
        } catch {
            print("Failed to save to Core Data: \(error)")
        }
    }

    func fetchEntries() -> [APIEntity] {
        let context = persistentContainer.viewContext
        let request: NSFetchRequest<APIEntity> = APIEntity.fetchRequest()
        
        // Sort by the 'order' attribute if you want to preserve JSON order.
        let sortDescriptor = NSSortDescriptor(key: "order", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            let results = try context.fetch(request)
            print("Fetched \(results.count) entries.")
            return results
        } catch {
            print("Failed to fetch entries: \(error)")
            return []
        }
    }

   
}
