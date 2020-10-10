//
//  CoreDataManager.swift
//  IntervalTimer
//
//  Created by Денис Дубовиков on 10.10.2020.
//

import Foundation
import CoreData

protocol CoreDataManager {
    func performSave(context: NSManagedObjectContext)
}
