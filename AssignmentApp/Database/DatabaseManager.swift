//
//  DatabaseManager.swift
//  AssignmentApp
//
//  Created by Chitralekha Yellewar on 01/12/20.
//

import Foundation
import RealmSwift

class DatabaseManager {
    
    //MARK:- save data to Realm
    func saveObject(_ data: Country) {
        do {
            let realm = try Realm()
            try! realm.write {
                realm.add(data)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //MARK:- save array of data to Realm.
    func saveData(_ data: [Country]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            
            for content in data {
                realm.add(content)
            }
            
            try! realm.commitWrite()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //MARK:- get data from realm.
    func getDataFromDatabase() -> [Country] {
        var contentsFromDB = [Country]()
        do {
            let realm = try Realm()
            let contents = realm.objects(Country.self)
            contentsFromDB = contents.map{$0}
        } catch {
            print(error.localizedDescription)
        }
        return contentsFromDB
    }
    
    //MARK:- delete an object from realm.
    func deleteObject(_ data: Country) {
        do {
            let realm = try Realm()
            try! realm.write {
                realm.delete(data)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //MARK:- clear all data from Realm.
    func clearAllData() {
        do {
            let realm = try Realm()
            realm.deleteAll()
        } catch {
            print(error.localizedDescription)
        }
    }
}
