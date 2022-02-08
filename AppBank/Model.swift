//
//  Model.swift
//  AppBank
//
//  Created by Илья Новиков on 13.01.2022.
//

import Foundation
import RealmSwift

class Model: Object {
    @objc dynamic var nameUser: String = ""
    @objc dynamic var timeAndDate: String? = nil
    @objc dynamic var operation: String? = nil
    @objc dynamic var target: String = ""
    @objc dynamic var sum: Float = 0.0
    @objc dynamic var type: String = ""
    
    convenience init(_ timeAndDateOperation: String?,_ operationTransfer: String?,_ name:String,_ idNumber:String,_ currentSum:Float) {
        self.init()
        timeAndDate = timeAndDateOperation
        operation = operationTransfer
        nameUser = name
        type = idNumber
        sum = currentSum
    }
}

