//
//  AddTransectionCell.swift
//  SpitAppDemo
//
//  Created by Sushobhit.Jain on 30/11/21.
//

import UIKit

class AddTransectionCell: UITableViewCell {
    
    @IBOutlet weak var nameL:UILabel!
    @IBOutlet weak var amountTF:UITextField!
    
    var user:UserTransectionModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.amountTF.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpData() {
        self.nameL.text = self.user?.name ?? ""
    }
    
}
extension AddTransectionCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        user?.amount = Double(amountTF.text ?? "0.00") ?? 0.00
    }
}
