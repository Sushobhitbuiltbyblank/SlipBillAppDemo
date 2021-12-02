//
//  SlipTransectionManagerProtocol.swift
//  SpitAppDemo
//
//  Created by Sushobhit.Jain on 30/11/21.
//

import Foundation

protocol SlipTransectionManagerProtocol {
    func addEntry(_ userTrans:[UserTransectionModel]) -> Bool
    func getCurrentEntry(index:Int)-> SplitEntry?
    func getCurrentUserTransections(index:Int,user:UserTransectionModel)-> [UserTransectionModel]?
    
}
