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
    
    
    @State private  var  result  = Bool.random()
    @State private var randomMove = Int.random(in:0..<3)
    @State private var score = 0
    @State private var  turn  = 0
    @State private var finalTurn = 10
    @State private var showingAlert = false
    
    
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            
            
            
            VStack (alignment: .leading){
                
                Text("Score: \(score)")
                    .font(.title2).bold()
                    .padding()
                
                
                
                VStack {
                    
                    
                    Text(result ? "You should Win" : "You should Lose").bold()
                        .font(.largeTitle)
                    
                    
                    
                    VStack(spacing: 20) {
                        Text("App choice: ")
                            .font(.title2)
                        
                        
                        Image("\(moves[randomMove])")
                        
                        
                        
                        
                        HStack {
                            ForEach(0..<3) {
                                num in
                                
                                Button(action: {
                                    
                                    randomElement(num)
                                    next()
                                }, label: {
                                    Image(moves[num])
                                        .resizable()
                                        .scaledToFit()
                                        .frame( height: 150)
                                        .padding(.horizontal, 10)
                                    
                                })
                            }
                        }
                        .alert("Do you want to start again? 🧐", isPresented: $showingAlert) {
                            Button("Reset", action: reset)
                        } message: {
                            Text("Your final escore is:  \(score) ")
                        }
                        
                        Spacer()
                        Text(" \(turn) / 10 ")
                            .font(.title)
                        
                        
                        
                        
                    }
                    
                    
                }
                
                
                
            }
            
            
            
            
            
        }
    }
    func randomElement(_ num: Int) {
        
        
        if result  ==  true  {
            if randomMove == 0 && num == 1 {
                
                
                score += 1
            } else if randomMove == 1 && num == 2 {
                
                
                score += 1
            } else if randomMove == 2 && num == 0 {
                
                
                score += 1
            } else {
                score -= 1
            }
            
            
        }
        else {
            if randomMove == num {
                
                score += 1
            } else if randomMove == 0 && num == 2 {
                score += 1
            } else if randomMove == 1 && num == 0 {
                
                score += 1
            } else if randomMove == 2 && num == 1 {
                
                score += 1
            } else {
                score -= 1
            }
        }
        
        turn  += 1
        
        if turn == finalTurn {
            showingAlert = true
        }
    }
    
    func next() {
        randomMove = Int.random(in: 0 ..< 3)
        result  = Bool.random()
    }
    
    func reset() {
        score = 0
        turn = 0
    }
    
    
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

