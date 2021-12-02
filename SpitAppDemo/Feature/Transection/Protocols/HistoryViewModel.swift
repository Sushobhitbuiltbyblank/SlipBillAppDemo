//
//  HistoryViewModel.swift
//  SpitAppDemo
//
//  Created by Sushobhit.Jain on 30/11/21.
//

import Foundation

protocol HistoryViewModel {
    func getTransection(atIndex: Int) -> UserTransectionModel? 
    func getUserCount()-> Int
}
