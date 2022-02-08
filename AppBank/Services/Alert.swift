//
//  Alert.swift
//  AppBank
//
//  Created by Илья Новиков on 23.01.2022.
//

import Foundation
import UIKit

class AlertService {
    private init (){}
    static let shared = AlertService()
    let pickerSelect = ViewControllerWithPicker()
    
    func sucsessTransfer(controller: UIViewController) {
        let alert = UIAlertController(title: "Успешно", message: "Внимание, все операции выполняются в течении 24 часов.", preferredStyle: .alert)
        let confirmButton = UIAlertAction(title: "Окей", style: .cancel, handler: nil)
        alert.addAction(confirmButton)
        controller.present(alert, animated: true)
    }
    
    func chekFieldsWithAlerts(controller: UIViewController) {
        if pickerSelect.pickerRow == 0 {
            let alert = UIAlertController(title: "Что-то не так", message: "Проверьте поля на корректность заполнения. Формат : +7********** или ****************", preferredStyle: .alert)
            let confirmButton = UIAlertAction(title: "Окей", style: .cancel, handler: nil)
            alert.addAction(confirmButton)
            controller.present(alert, animated: true)
        } else if pickerSelect.pickerRow == 1 {
            let alert = UIAlertController(title: "Что-то не так", message: "Проверьте поля на корректность заполнения. Формат : +7**********", preferredStyle: .alert)
            let confirmButton = UIAlertAction(title: "Окей", style: .cancel, handler: nil)
            alert.addAction(confirmButton)
            controller.present(alert, animated: true)
        }
        
    }
    func checkBalance(controller: UIViewController) {
        let alert = UIAlertController(title: "Недостаточно средств", message: "Проверьте ваш баланс на наличие средств перед выполнением операции", preferredStyle: .alert)
        let confirmButton = UIAlertAction(title: "Окей", style: .cancel, handler: nil)
        alert.addAction(confirmButton)
        controller.present(alert, animated: true)
    }
}
