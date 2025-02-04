//
//  PersistenceController.swift
//  chaitanyagondkar_Milestone3
//
//  Created by admin on 04/02/25.
//

import Foundation
import CoreData
struct PersistenceController {
    //
    static  let shared = PersistenceController()
    
    let container : NSPersistentContainer
    //init
    init(inMemory : Bool = false) {
        container = NSPersistentContainer(name:"FitnessDB")
        
        if inMemory{
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores{_, error in
            if let error  = error as NSError? {
                fatalError("Unresolved Error: \(error), \(error.userInfo)")
            }
        }
        
        
    }
    
    func saveContext(){
        let context = container.viewContext
        if context.hasChanges{
            try? context.save()
        }
    }
}
