//
//  EntryModel.swift
//  SpitAppDemo
//
//  Created by Sushobhit.Jain on 30/11/21.
//

import Foundation


struct SplitEntry {
    var users:[UserTransectionModel]
    
    func getActualAmountUser(index:Int)-> UserTransectionModel? {
        let count:Double = Double(users.count)
        let total = users.reduce(0){ return ($0 + $1.amount) }
        let eachAmount = total/count
        if users.count > index {
            let user = users[index]
            return UserTransection(name: user.name, amount: eachAmount - user.amount)
        } else {
            return nil
        }
    }
}
