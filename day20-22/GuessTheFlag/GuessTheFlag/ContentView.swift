//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by LILIA MARIANGEL on 04/15/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries: [String] = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private  var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    let questions = 8
    @State private var currentquestion = 0
    
    @State private var showingReset = false
    @State private var isCorrect = false
    @State private var selectedNumber = 0
    @State private var isOutOpacity = false
    
    
    
    
    
    
    //ViewModifier
struct FlagView: View {
        var flag: String
        
        
        var body: some View {
            Image(flag)
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(radius: 5)
            
            
            
        }
        
    }
    
    
    var body: some View {
        
        ZStack {
            RadialGradient(stops: [
                .init(color: .purple, location: 0.3),
                .init(color: .pink, location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack (spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                    
                 
                            
                            withAnimation {
                                // flag was tapped
                                flagTapped(number)
                            }
                            
                            
                            
                            
                        } label: {
                            FlagView(flag: self.countries[number])
                            //Animation challenge 
                                .rotation3DEffect(.degrees(isCorrect && selectedNumber == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                                .opacity( isOutOpacity && selectedNumber != number ? 0.25 : 1 )
                            
                            
                            
                            
                            
                            //                            Image(countries[number])
                            //                                .renderingMode(.original)
                            //                                .clipShape(Capsule())
                            //                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                HStack (spacing: 80){
                    
                    Text("Question:  \(currentquestion)" )
                    Text("Score: \(score)" )
                    
                    
                }
                .foregroundColor(.white)
                .font(.title.bold())
                
                
                Spacer()
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        
        .alert("Do you want to start again?", isPresented: $showingReset) {
            Button("Reset", action: reset)
        } message: {
            Text("Your final escore is:  \(score)")
        }
    }
    func flagTapped(_ number: Int) {
        self.selectedNumber = number
        if number == correctAnswer {
            
            scoreTitle = "Correct"
            score += 1
            isCorrect = true
            isOutOpacity = true
            
            
            
        } else {
            
            scoreTitle = "Wrong! That’s the flag of \(countries[number]) "
           
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            showingScore = true
        }
        
        currentquestion += 1
        
        
        
        if currentquestion == questions {
            showingReset = true
            
        }
        
        
        
        
    }
    func askQuestion() {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        isCorrect = false
        isOutOpacity = false
        
        
        
        
        
    }
    
    
    func reset() {
        score = 0
        currentquestion = 0
        showingScore = false
        
        
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
