//
//  TableViewController.swift
//  AppBank
//
//  Created by Илья Новиков on 02.02.2022.
//

import UIKit
import RealmSwift

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model: Results<Model>!
    let realm = RealmService.shared.rm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        model = realm.objects(Model.self)
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.setupCell(with: model[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}
