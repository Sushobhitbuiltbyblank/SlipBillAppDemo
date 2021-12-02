//
//  SlipTransectionManager.swift
//  SpitAppDemo
//
//  Created by Sushobhit.Jain on 30/11/21.
//

import Foundation

class SlipTransectionManager {
    static let shared : SlipTransectionManager = SlipTransectionManager()
    private var entries:[SplitEntry]?
    private init() {
        self.entries = [SplitEntry]()
    }
}

extension SlipTransectionManager : SlipTransectionManagerProtocol {
    
    func addEntry(_ userTrans:[UserTransectionModel]) -> Bool {
        self.entries?.append(SplitEntry(users: userTrans))
        return true
    }
    
    func getCurrentEntry(index:Int)-> SplitEntry? {
        guard let entryList = self.entries, entryList.count > index else {
            return nil
        }
        return entryList[index]
    }
    
    func getCurrentUserTransections(index:Int,user:UserTransectionModel)-> [UserTransectionModel]? {
        guard let entryList = self.entries, entryList.count > index else {
            return nil
        }
        let total = entryList[index].users.reduce(0){ return ($0 + $1.amount) }
        let count:Double = Double(entryList[index].users.count)
        let eachAmount = total/count
        var arr = [UserTransectionModel]()
        arr.append(contentsOf: entryList[index].users.filter({ $0.name != user.name }))
        let result = arr.map { model in
            return UserTransection(name: model.name, amount: (eachAmount - model.amount))
        }
        return result
    }
}

