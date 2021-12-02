//
//  UserTransection.swift
//  SpitAppDemo
//
//  Created by Sushobhit.Jain on 30/11/21.
//

import Foundation

class UserTransection:UserTransectionModel{
    var name:String = ""
    var amount:Double = 0.0
    
    init(name:String,amount:Double) {
        self.name = name
        self.amount = amount
    }
}


