//
//  ViewsAsProperties.swift
//  ViewsAndModifiers
//
//  Created by LILIA MARIANGEL on 04/18/22.
//

import SwiftUI

struct ViewsAsProperties: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    var spells: some View {
        Group {
               Text("Lumos")
               Text("Obliviate")
           }
    }
    
    @ViewBuilder var spell: some View {
      
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
            
            spells
        }
    }
}

struct ViewsAsProperties_Previews: PreviewProvider {
    static var previews: some View {
        ViewsAsProperties()
    }
}
