//
//  AllTransectionViewModel.swift
//  SpitAppDemo
//
//  Created by Sushobhit.Jain on 30/11/21.
//

import Foundation


protocol AllTransectionViewModel {
    func getTransectionCount() -> Int
    func getTransection(atIndex: Int) -> UserTransectionModel? 
}



