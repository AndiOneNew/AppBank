//
//  UserInfo.swift
//  AppBank
//
//  Created by Илья Новиков on 28.01.2022.
//

import Foundation
import RealmSwift

class UserInfo: Object {
    let userFirstName = "Инзиль"
    let userLastName = "Карибуллин"
    @objc dynamic var userBalance:Float = 10000.0
    
    func updateBalance(_ currentBalance:Float) {
        userBalance = currentBalance
//        Попытка сохранить обновленную сумму,что бы в дальнейшем считать баланс при перезапуске
        let userDefaults = UserDefaults.standard
        userDefaults.set(userBalance, forKey: "sum")
    }
}
