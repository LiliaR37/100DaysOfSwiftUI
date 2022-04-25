//
//  ContentView.swift
//  WordScramble
//
//  Created by LILIA MARIANGEL on 04/24/22.
//

import SwiftUI

struct ContentView: View {
    
    let peoples = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        List {
            ForEach(peoples, id: \.self) {
                people in
                
                Text("\(people)")
            }
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
