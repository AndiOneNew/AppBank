//
//  ViewControllerWithPicker.swift
//  AppBank
//
//  Created by Илья Новиков on 14.01.2022.
//

import UIKit
import SwiftUI
import RealmSwift

class ViewControllerWithPicker: UIViewController {
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdLabel: UITextField!
    @IBOutlet weak var PickerView: UIPickerView!
    
    let user = UserInfo()
    var model = Model()
    weak var delegate: ViewControllerDelegate?  // Слабая ссылка на прокотол
    var pickerRow = 0
    var pickerRowOperation = "Перевод"
    var arrayUserSelected = ["Перевод","Пополнение баланса"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        textFieldKeyboarType()
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        guard let idNumber = firstTextField.text else { return }
        guard let sum = secondTextField.text else { return }
        guard let name = thirdLabel.text else { return }
        operationMoney(idNumber, sum, name)
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func operationMoney(_ idNumber: String,_ sum: String,_ name:String) {
        if firstTextField.text!.isEmpty || secondTextField.text!.isEmpty {
            AlertService.shared.chekFieldsWithAlerts(controller: self)
        } else if Float(sum)! <= user.userBalance {
                let newBalance = user.userBalance - Float(sum)!
                delegate?.update(newBalance)
                user.updateBalance(newBalance)
            let newOperations = Model(getDate(), pickerRowOperation, name, idNumber, Float(sum)!)
                RealmService.shared.create(newOperations)
                AlertService.shared.sucsessTransfer(controller: self)
        }
        AlertService.shared.checkBalance(controller: self)
    }
    
    func textFieldKeyboarType() {
        firstTextField.keyboardType = .phonePad
        secondTextField.keyboardType = .decimalPad
    }
    
    //    Функция получения времени и даты
    func getDate() -> String {
        let time = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY HH:mm"                 //формат
        formatter.timeZone = TimeZone(secondsFromGMT: +2)         // указатель временной зоны относительно гринвича
        let formattedDate = formatter.string(from: time as Date)
        return String(formattedDate)
    }
    
    //    Скрыть клавиатуру по касанию вне поле
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as? UITouch {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
}

extension ViewControllerWithPicker: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Picker view data source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayUserSelected.count
    }
    // MARK: - Picker view delegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //        В зависимости от выбора пикера показывать определенные placeholder's и textFields
        switch row {
        case 0:
            pickerRow = 0
            pickerRowOperation = "Перевод"
            firstTextField.placeholder = "Введите номер телефона или карты"
            secondTextField.placeholder = "Введите сумму для перевода"
            thirdLabel.isHidden = false
            
        case 1:
            pickerRow = 1
            pickerRowOperation = "Пополнение баланса"
            firstTextField.placeholder = "Введите номер телефона"
            secondTextField.placeholder = "Введите сумму для пополнения"
            thirdLabel.isHidden = true
            
        default:
            break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayUserSelected[row]
    }
    
    func setup() {
        PickerView.delegate = self
        PickerView.dataSource = self
    }
    
}
