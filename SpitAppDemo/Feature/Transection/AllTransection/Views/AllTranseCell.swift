//
//  AllTranseCell.swift
//  SpitAppDemo
//
//  Created by Sushobhit.Jain on 30/11/21.
//

import UIKit

class AllTranseCell: UITableViewCell {
    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var amountL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(user:UserTransectionModel) {
        self.nameL.text = user.name
        
        if user.amount >= 0 {
            self.amountL.text = "+\(user.amount)"
            self.amountL.textColor = .green
        } else {
            self.amountL.text = "\(user.amount)"
            self.amountL.textColor = .red
        }
    }

}
