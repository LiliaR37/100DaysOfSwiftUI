//
//  Expenses.swift
//  iExpense
//
//  Created by LILIA MARIANGEL on 05/10/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
    
    func didSet() {
           if let encoded = try? JSONEncoder().encode(items) {
               UserDefaults.standard.set(encoded, forKey: "Items")
           }
       }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
    
    func removeItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
