//
//  ExpensesItem.swift
//  iExpense
//
//  Created by LILIA MARIANGEL on 05/10/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id: String = UUID().uuidString
    let name: String
    let type: String
    let amount: Double
    
    
}
