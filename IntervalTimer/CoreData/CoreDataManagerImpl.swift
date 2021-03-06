//
//  CoreDataManagerImpl.swift
//  IntervalTimer
//
//  Created by Денис Дубовиков on 10.10.2020.
//

import Foundation
import CoreData

class CoreDataManagerImpl: CoreDataManager {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "IntervalTimer")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    public var _masterContext : NSManagedObjectContext?
    public var masterContext : NSManagedObjectContext? {
        get{
            if _masterContext == nil {
                let context = persistentContainer.newBackgroundContext()
                _masterContext = context
            }
            return _masterContext
        }
    }
    
    private var _mainContext : NSManagedObjectContext?
    public var mainContext : NSManagedObjectContext? {
        get{
            if _mainContext == nil {
                let context = persistentContainer.viewContext
                _mainContext = context
            }
            
            return _mainContext
        }
    }
    
    private var _saveContext : NSManagedObjectContext?
    public var saveContext : NSManagedObjectContext? {
        get{
            if _saveContext == nil {
                let context = persistentContainer.newBackgroundContext()
                _saveContext = context
            }
            return _saveContext
        }
    }
  
    
    public func performSave (context: NSManagedObjectContext) {
        if context.hasChanges {
            context.perform { [weak self] in
                do {
                    try context.save()
                }
                catch {
                    print("Context save error: \(error)")
                }
                guard let self = self else {return}
                if let parent = context.parent {
                    self.performSave(context: parent)
                }
                
                }
        }
    }
}
