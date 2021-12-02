//
//  AddTransactionViewModel.swift
//  SpitAppDemo
//
//  Created by Sushobhit.Jain on 30/11/21.
//

import Foundation


protocol AddTransactionViewModel {
    func getUser(index:Int) -> UserTransectionModel?
    func getUserCount() -> Int
    func saveRecord(completion:@escaping (Bool)->Void)
}
