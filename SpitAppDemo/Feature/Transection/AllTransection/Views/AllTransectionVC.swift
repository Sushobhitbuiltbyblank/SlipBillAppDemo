//
//  ViewController.swift
//  SpitAppDemo
//
//  Created by Sushobhit.Jain on 30/11/21.
//

import UIKit

class AllTransectionVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var vm:AllTransectionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        
        // Add Bar button
        let addBnt = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addTransection))
        self.navigationItem.rightBarButtonItem = addBnt
        
        // Config TableView
        self.tableView.tableFooterView = UIView()
        self.vm = AllTransectionVM(splitManager: SlipTransectionManager.shared)
    }
    
    @objc func addTransection() {
        guard let next = self.storyboard?.instantiateViewController(withIdentifier: "AddTransactionVC") as? AddTransactionVC else {
            debugPrint("Add Transection not in Stroyboard")
            return
        }
        next.vm = AddTransectionVM()
        next.delegate = self
        self.navigationController?.pushViewController(next, animated: true)
    }


}


extension AllTransectionVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm?.getTransectionCount() ?? 0
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

extension AllTransectionVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        guard let user = self.vm?.getTransection(atIndex: index) else {
            return
        }
        guard let next = self.storyboard?.instantiateViewController(withIdentifier: "HistoryVC") as? HistoryVC else {
            debugPrint("Add Transection not in Stroyboard")
            return
        }
        next.vm = HistoryVM(splitManager: SlipTransectionManager.shared, user: user)
        self.navigationController?.pushViewController(next, animated: true)
    }
}

extension AllTransectionVC : UpdateTransectionViewProtocol {
    func updateTransectionList() {
        self.tableView.reloadData()
    }
    
    
}


