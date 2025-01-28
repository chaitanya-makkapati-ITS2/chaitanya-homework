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
        persistentContainer = NSPersistentContainer(name: "APIApp")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }

    func saveEntries(_ entries: [APIEntry]) {
        let context = persistentContainer.viewContext

        entries.forEach { entry in
            let apiEntity = APIEntity(context: context)
            apiEntity.api = entry.api
            apiEntity.descriptionText = entry.description
            apiEntity.auth = entry.auth
            apiEntity.https = entry.https
            apiEntity.cors = entry.cors
            apiEntity.link = entry.link
            apiEntity.category = entry.category
        }

        do {
            try context.save()
        } catch {
            print("Failed to save to Core Data: \(error)")
        }
    }

    func fetchEntries() -> [APIEntity] {
        let context = persistentContainer.viewContext
        let request: NSFetchRequest<APIEntity> = APIEntity.fetchRequest()

        do {
            return try context.fetch(request)
        } catch {
            print("Failed to fetch entries: \(error)")
            return []
        }
    }
}
