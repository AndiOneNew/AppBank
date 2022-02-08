//
//  ViewController.swift
//  AppBank
//
//  Created by Илья Новиков on 12.01.2022.
//

import UIKit
import RealmSwift

//  Протокол для проброса баланса с второго контроллера
protocol ViewControllerDelegate: class {
    func update(_ float: Float)
}


class ViewController: UIViewController {
    
    @IBOutlet weak var moneyOperation: UIButton!
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var balanceUserLabel: UILabel!
    @IBOutlet weak var imageUserView: UIImageView!
    
    let user = UserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoAboutUser()
    }
    
//    @IBAction func ShowMoneyOperations(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = (storyboard.instantiateViewController(withIdentifier: "ViewControllerWithPicker"))
//        present(vc, animated: true, completion: nil)
//    }
    
    @IBAction func HistoryOperation(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = (storyboard.instantiateViewController(withIdentifier: "TableViewController"))
        present(vc, animated: true, completion: nil)
    }
    
    func infoAboutUser() {
        imageUserView.image = UIImage(named: "imageUser")
        imageUserView.layer.cornerRadius = imageUserView.frame.size.width / 2
        nameUserLabel.text = user.userFirstName + " " + user.userLastName
//       Попытка считать данные,но по умолчанию в модели всегда данное число и этот метод не срабатывает
        if user.userBalance == 10000.0 {
            balanceUserLabel.text = "Ваш баланс: " + String(user.userBalance)
        } else {
            let userDefaultsGet = UserDefaults.standard
            let getSum = userDefaultsGet.object(forKey: "sum") as! Float
            balanceUserLabel.text = "Ваш баланс: " + String(getSum)
        }
        
    }
}

//  Реализация протокола для проброса числа
extension ViewController: ViewControllerDelegate {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let destination = segue.destination as? ViewControllerWithPicker else { return }
            destination.delegate = self
        }

    func update(_ float: Float) {
        balanceUserLabel.text = "Ваш баланс: " + String(float)
    }
}


