//
//  Realm.swift
//  AppBank
//
//  Created by Илья Новиков on 23.01.2022.
//

import Foundation
import RealmSwift

class RealmService {
    static let shared = RealmService()
    var rm = try! Realm()
    
    func create<T:Object>(_ object: T){
        do {
            try rm.write{
                rm.add(object)
            }
        } catch {
            print("Cant create: \(error.localizedDescription)")
        }
    }
}
