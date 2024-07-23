//
//  DataInterface.swift
//  Learnable
//
//  Created by Bryan Mina on 6/16/24.
//

import Foundation
import CoreData
import SwiftUI


/// Singleton persistent container
class CoreDataStack {
    static let shared = CoreDataStack()
    let persistentContainer: NSPersistentContainer
    
    private init(){
        persistentContainer = NSPersistentContainer(name: "DataBase")
        persistentContainer.loadPersistentStores { (descrtipion, error) in
            if let error = error {
                fatalError("Failed to load CoreData stack \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func save(){
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Error in saving \(error)")
        }
    }
}
