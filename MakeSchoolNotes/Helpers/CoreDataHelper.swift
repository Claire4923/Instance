//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Claire on 2017/7/26.
//  Copyright © 2017年 MakeSchool. All rights reserved.
//

import Foundation

import CoreData
import UIKit

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    //static methods will go here
    
    static func saveNote() {
        do{
            try managedContext.save()
        }
        catch let error as NSError{
            print("Could not save \(error)")
        }
    }
    
    static func newNote() -> Note{
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext)
        return note as! Note
    }

    static func delete(note:Note){
        managedContext.delete(note)
        saveNote()
    }
    
    static func retrieveNotes() -> [Note] {
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results.reversed()
        }
        catch let error as NSError{
            print("Could not save \(error)")
        }
        return []
    }
}
