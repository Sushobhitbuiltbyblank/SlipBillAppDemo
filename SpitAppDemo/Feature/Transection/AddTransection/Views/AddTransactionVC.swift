//
//  AddTransactionVC.swift
//  SpitAppDemo
//
//  Created by Sushobhit.Jain on 30/11/21.
//

import UIKit

class AddTransactionVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveBtn: UIButton!
    weak var delegate:UpdateTransectionViewProtocol?
    var vm:AddTransactionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
        self.setUpInitialData()
    }
   
    func setUPUI() {
        self.tableView.register(UINib(nibName: "AddTransectionCell", bundle: nil), forCellReuseIdentifier: "AddTransectionCell")
        self.tableView.tableFooterView = UIView()
    }
    
    func setUpInitialData() {
        
    }

    @IBAction func saveAction(_ sender: Any) {
        self.vm?.saveRecord { isSuccess  in
            if isSuccess {
                self.delegate?.updateTransectionList()
                self.navigationController?.popViewController(animated: true)
            }
        }        
    }
    
}

extension AddTransactionVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.getUserCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddTransectionCell", for: indexPath) as? AddTransectionCell else {
            return UITableViewCell()
        }
        
        guard let user = vm?.getUser(index: indexPath.row) else {
            return UITableViewCell()
        }
        cell.user = user
        cell.setUpData()
        
        return cell
    }
    
    
}

extension AddTransactionVC : UITableViewDelegate {
    
}

