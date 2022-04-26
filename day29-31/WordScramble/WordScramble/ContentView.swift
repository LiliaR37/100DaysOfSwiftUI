//
//  ContentView.swift
//  WordScramble
//
//  Created by LILIA MARIANGEL on 04/24/22.
//

import SwiftUI

struct ContentView: View {
    
    //words they have already used,
    @State private var usedWords = [String]()
    
    //a root word for them to spell other words from
    @State private var rootWord = ""
    
    // string we can bind to a text field
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    
                    Section {
                        TextField("Enter your word", text: $newWord)
                            .autocapitalization(.none)
                    }
                    Section {
                        ForEach(usedWords, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                        }
                        }
                        
                    }
                .listStyle(GroupedListStyle())
                .navigationTitle(rootWord)
                .toolbar {
                    Button("Restart") {
                        startGame()
                        score = 0
                        usedWords = [String]()
                    }
            }
                
                Text(" Score: \(score)")
                    .font(.largeTitle)
                   
                    
            }
            }
            
            .onSubmit (addNewWord)
        
        //view modifier for running a closure when a view is shown
            .onAppear(perform: startGame)
         
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        }
    
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit if the remaining string is empty
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard isShorter(word: answer) else {
            wordError(title: "Word not allowed", message: "You can't write  word that are shorter than three letters ")
            return
        }
       
    
        
        //Insert that word at position 0 in the usedWords array
        //Set newWord back to be an empty string
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
        
        //Score
        if (usedWords.count != 0) {
            let scoreCount = answer.count
            score += scoreCount
        }
    }
    
    func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")

                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"

                // If we are here everything has worked, so we can exit
                return
                
            }
        }

        // If were are *here* then there was a problem – trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
        
       
        
    }
    
    //the word original (it hasn’t been used already)
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    //is the word possible
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    
    func isShorter(word: String) -> Bool {
        
        if word.count <= 3  {
            return false
        } else {
            return true
        }
    }
    
    func score(word: String) -> Bool {
        let scoreWord = word.count
        
        if scoreWord == word.count {
            score += scoreWord
            return true
        } else {
            return false
        }
        
    }
    
    //UITextChecker
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    
  
    
    //alert
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

