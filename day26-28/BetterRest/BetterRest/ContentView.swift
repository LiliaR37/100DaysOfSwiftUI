//
//  ContentView.swift
//  BetterRest
//
//  Created by LILIA MARIANGEL on 04/22/22.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
        
    }
    
    var  calculateBedtime: String {
        
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            
            return  sleepTime.formatted(date: .omitted, time: .shortened)
            
            
            
        } catch {
            
            return "Sorry, there was a problem calculating your bedtime."
            
        }
        
        
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                } header: {
                    Text("When do you want to wake up?")
                    
                }
                
                Section {
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    
                } header: {
                    Text("Desired amount of sleep")
                    
                }
                
                Section {
                    
                    Picker("☕️", selection: $coffeeAmount) {
                        ForEach(1..<20) {
                            cup in
                            
                            Text("\(cup)")
                        }
                    }
                    //                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                } header: {
                    Text("Daily coffee intake")
                    
                }
                
                Section{
                    Text("\(calculateBedtime)")
                        .font(.largeTitle)
                        .padding(.horizontal, 100)
                } header: {
                    Text("Your ideal bedtime is: ")
                    
                }
                
            }
            .font(.headline)
            .foregroundColor(.black)
            
            .navigationTitle("BetterRest ⏰")
            
            //            .toolbar {
            //                Button("Calculate", action: calculateBedtime)
            //            }
            //            .alert(alertTitle, isPresented: $showingAlert) {
            //                Button("OK") { }
            //            } message: {
            //                Text(alertMessage)
            //            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
