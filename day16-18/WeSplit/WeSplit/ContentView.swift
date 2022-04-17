//
//  ContentView.swift
//  WeSplit


import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // calculate the total per person
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
     
    }
    
    //challenge task
    var totalValue:Double {
        let tipSelected = Double(tipPercentage)
        
        let tipValueTotal = checkAmount / 100 * tipSelected
        
        let total =  checkAmount + tipValueTotal
        return total
        
    }
    
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                        
                  
                    Picker("Number of people", selection: $numberOfPeople) {
                        
                        //challenge task
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                    
                    
                }
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        
                        ForEach(0 ..< 101 ) {
                            Text("\($0)%")
                        }
                    }
                   
                }header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header: {
                    Text("Amount per person")
                }
                
                Section {
                    Text(totalValue, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header: {
                    //challenge task
                    Text("Total amount")
                }
            }
            .navigationTitle("WeSplit")
            
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
