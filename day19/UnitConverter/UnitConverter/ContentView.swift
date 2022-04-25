//
//  ContentView.swift
//  UnitConverter
//
//  Created by LILIA MARIANGEL on 04/14/22.
//

import SwiftUI

struct ContentView: View {
    @State var textFieldInput: Double = 0
    @State var inputUnitSelection = UnitTemperature.celsius
    @State var outputUnitSelection =  UnitTemperature.fahrenheit
    
    let units: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
    
    @FocusState private var amountIsFocused: Bool
    
    var outputCalculation: Double {
        
       let inputM = Measurement(value:textFieldInput, unit: inputUnitSelection)
    
        let outputM = inputM.converted(to: outputUnitSelection)
        
        return outputM.value
      
        
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
                            Text($0.symbol)
                        }
                       
                        
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Select input unit : ")
                }
                
                Section {
                    Picker("Selection", selection: $outputUnitSelection) {
                        ForEach(units, id: \.self) {
                            Text($0.symbol)
                               
                        }
                        
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Select output unit ")
                }
                
                Section{
                    Text(outputCalculation,  format: .number)
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
