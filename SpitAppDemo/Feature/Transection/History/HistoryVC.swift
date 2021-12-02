//
//  HistoryVC.swift
//  SpitAppDemo
//
//  Created by Sushobhit.Jain on 30/11/21.
//

import UIKit

class HistoryVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var vm:HistoryViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    func setUpView() {
        // Config TableView
        self.tableView.tableFooterView = UIView()
    }
}

extension HistoryVC:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm?.getUserCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllTranseCell", for: indexPath) as? AllTranseCell else {
            return UITableViewCell()
        }
        guard let user = self.vm?.getTransection(atIndex: indexPath.row) else {
            return UITableViewCell()
        }
        cell.setupData(user: user)
        return cell
    }
    
    
}
