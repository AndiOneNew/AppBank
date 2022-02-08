//
//  TableViewCell.swift
//  AppBank
//
//  Created by Илья Новиков on 02.02.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var idNumberUserLabel: UILabel!
    @IBOutlet weak var sumLabel: UILabel!
    
    var model = Model()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
//    Метод заполнения ячейки
    func setupCell(with model:Model) {
        dateLabel.text = model.timeAndDate
        operationLabel.text = model.operation
        nameUserLabel.text = model.nameUser
        idNumberUserLabel.text = model.type
        sumLabel.text = String(model.sum) + " руб."
    }

}
