//
//  HistoryVM.swift
//  SpitAppDemo
//
//  Created by Sushobhit.Jain on 30/11/21.
//

import Foundation

class HistoryVM :HistoryViewModel {
    
    var splitManager:SlipTransectionManagerProtocol
    var user:UserTransectionModel
    
    init(splitManager:SlipTransectionManagerProtocol,user:UserTransectionModel) {
        self.splitManager = splitManager
        self.user = user
    }
    
    func getUserCount() -> Int {
        (self.splitManager.getCurrentEntry(index: 0)?.users.count ?? 1) - 1
    }
    
    func getTransection(atIndex: Int) -> UserTransectionModel? {
        if let transections = self.splitManager.getCurrentUserTransections(index: 0, user: self.user) {
            
            return transections[atIndex]
        } else {
            return nil
        }
    }
    
}

