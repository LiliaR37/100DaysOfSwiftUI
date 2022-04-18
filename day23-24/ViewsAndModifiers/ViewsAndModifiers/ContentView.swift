//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by LILIA MARIANGEL on 04/18/22.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var useRedText = false
    var body: some View {
        Button("Hello World") {
                  // flip the Boolean between true and false
                  useRedText.toggle()
              }
        //Conditional modifiers
              .foregroundColor(useRedText ? .red : .blue)
          }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
