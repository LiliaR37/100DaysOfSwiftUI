//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by LILIA MARIANGEL on 04/20/22.
//

import SwiftUI

struct ContentView: View {
    @State var backgroundColor: Color = Color("myColor")
    @State private var moves = ["rock", "paper", "scissors"]
    
    @State private var winningMoves = ["paper", "scissors", "rock"]
    
    @State private  var showTitle = Bool.random()
    @State private var randomMove = Int.random(in: 0...2)
    @State private var score = 0
    
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
           
         
            
            
            VStack (alignment: .leading){
                
                Text("Score: \(score)")
                    .font(.title2).bold()
                
                Spacer()
                VStack {
                  
                    Text(showTitle ? "You should Win" : "You should Lose").bold()
                        .font(.largeTitle)
                    
                    
                    
                    VStack(spacing: 20) {
                       Text("App choice: ")
                            .font(.headline)
                           
                      
                        
                        
                        HStack {
                            ForEach(0..<3) {
                                num in
                                
                                Button {
                                    randomElement(num)
                                } label: {
                                    Image(moves[num])
                                        .resizable()
                                        .scaledToFit()
                                        .frame( height: 150)
                                        .padding(.horizontal, 10)
                                        
                            }
                        }
                        }
                    
                }
                 
                   
                }
                Spacer()
               
            }
            .padding()
        
           
        
            
    }
    }
    func randomElement(_ num: Int)  {
        if num == randomMove {
    
          score += 1
            
        } else {
            score -= 1
        }
    }
    
  
    
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

