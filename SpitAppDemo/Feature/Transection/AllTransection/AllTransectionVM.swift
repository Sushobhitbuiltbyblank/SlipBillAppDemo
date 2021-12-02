//
//  AllTransectionVM.swift
//  SpitAppDemo
//
//  Created by Sushobhit.Jain on 30/11/21.
//

import Foundation


class AllTransectionVM:AllTransectionViewModel {
    
    var splitManager:SlipTransectionManagerProtocol
    
    init(splitManager:SlipTransectionManagerProtocol) {
        self.splitManager = splitManager
    }
    
    func getTransectionCount() -> Int {
        return self.splitManager.getCurrentEntry(index: 0)?.users.count ?? 0
    }
    
    func getTransection(atIndex: Int) -> UserTransectionModel? {
        let entry = self.splitManager.getCurrentEntry(index: 0)
        return entry?.getActualAmountUser(index: atIndex)
    }
    
}
