//
//  ContentView.swift
//  UnitConverter
//
//  Created by LILIA MARIANGEL on 04/14/22.
//

import SwiftUI

struct ContentView: View {
    @State var textFieldInput: Double = 0
    @State var texfieldOutput: Double = 0
    @State var inputUnitSelection = ""
    @State var outputUnitSelection = ""
    
    let units: [String] = ["Celcius", "Farenheit","Kelvins"]
    
    @FocusState private var amountIsFocused: Bool
    
    var inputCalculation: Double {
        
        
        if outputUnitSelection == "Farenheit" {
            let farenheit = (textFieldInput * 1.8 ) + 32
            return farenheit
            
        } else if outputUnitSelection == "Kelvins" {
            let kelvins = (textFieldInput + 273.15)
           return kelvins
        } else {
            return 0
        }
    
        
    }
   
    var body: some View {
       
        NavigationView {
            Form {
                Section {
                    TextField("Unit", value: $textFieldInput, format: .number)
                        .keyboardType(.numberPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Write unit in Celsius: ")
                }
                
                Section {
                    Picker("Select: ", selection: $inputUnitSelection) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                       
                        
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("To : ")
                }
                
                Section {
                    Picker("Selection", selection: $outputUnitSelection) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                               
                        }
                        
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("From : ")
                }
                
                Section{
                    Text( inputCalculation,  format: .number)
                }
                
                
            }
            .navigationTitle("Unit Converter")
            
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
