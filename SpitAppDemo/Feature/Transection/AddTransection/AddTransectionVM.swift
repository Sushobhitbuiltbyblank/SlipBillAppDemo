//
//  AddTransectionVM.swift
//  SpitAppDemo
//
//  Created by Sushobhit.Jain on 30/11/21.
//

import Foundation


class AddTransectionVM:AddTransactionViewModel {
    
    private var userList:[UserTransectionModel]?
    
    init() {
        self.setUpUIModel()
    }
    
    func setUpUIModel() {
        let userA = UserTransection(name: "A", amount: 0.00)
        let userB = UserTransection(name: "B", amount: 0.00)
        let userC = UserTransection(name: "C", amount: 0.00)
        let userD = UserTransection(name: "D", amount: 0.00)
        let userE = UserTransection(name: "E", amount: 0.00)
        userList = [userA,userB,userC,userD,userE]
    }
    
    
    func getUser(index: Int) -> UserTransectionModel? {
        if let users = self.userList, index < users.count {
            return users[index]
        }
        return nil
    }
    
    func getUserCount() -> Int {
        if let users = self.userList {
            return users.count
        } else {
            return 0
        }
    }
    
    func saveRecord(completion:@escaping (Bool)->Void) {
        let manager = SlipTransectionManager.shared
        completion(manager.addEntry(userList ?? []))
        
    }
    
}
