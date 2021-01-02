//
//  ContentView.swift
//  WorldScramble
//
//  Created by Jackson Barnes on 02/01/2021.
//

import SwiftUI

struct ContentView: View {
    init(){
            UITableView.appearance().backgroundColor = .clear
            let navBarAppearance = UINavigationBar.appearance()
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var playerScore = 0
    
    var body: some View {
        NavigationView {
            VStack{
                
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                   
                Button(action: {startGame()}, label: {
                    Text("New Game")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding()
                        
                })
                Button(action: {
                    startGame()
                    playerScore = 0
                    usedWords.removeAll()
                },
                label: {
                    Text("Reset Game")
                        .foregroundColor(.white)
                        .font(.title2)
                        
                })
                
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
                
                Text("Pina's Score: \(playerScore)")
                    .foregroundColor(.white)
            }
            .navigationBarTitle(rootWord)
            .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
            .onAppear(perform: startGame)
            .alert(isPresented: $showingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "That isn't a real word")
            return
        }
        
        guard isSame(word: answer) else {
            wordError(title: "Word not possible", message: "This word is the same as the root word")
            return
        }
        
        guard lessThanThree(word: answer) else {
            wordError(title: "Word is to short", message: "Think bigger!")
            return
        }
        
        let lengthOfWord = answer.count
        playerScore += 1 + lengthOfWord
        usedWords.insert(answer, at: 0)
        newWord = ""
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord.lowercased()
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isSame(word: String) -> Bool{
        if word == rootWord {
            return false
        } else {
            return true
        }
    }
    
    func lessThanThree(word: String) -> Bool{
        if word.count <= 3 {
            return false
        } else {
            return true
        }
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
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






/*Comments*/
//List {
//
//    Section(header: Text("Section 1")) {
//    Text("Static Row 1")
//    Text("Static Row 2")
//    }
//
//    Section(header: Text("Section 2")) {
//    ForEach(0..<5) {
//        Text("Dynamic Row \($0)")
//    }
//}
//
//    Section(header: Text("Section 3")) {
//    Text("Static Row 3")
//    Text("Static Row 4")
//    }
//}
//.listStyle(GroupedListStyle())

//List(0..<5) {
//    Text("Dynamic Row \($0)")
//}
//.listStyle(GroupedListStyle())

//DYNAMIC
//List(people, id: \.self) {
//    Text($0)
//}
//.listStyle(GroupedListStyle())
//STATIC
//List() {
//    ForEach(people, id: \.self){
//    Text($0)
//    }
//}

//Loading files in a bundle and unwrapping them
//if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
//    // we found the file
//    if let fileContents = try? String(contentsOf: fileURL) {
//        //if loaded contents
//    }
//}

//array of letters seperated by new line, checking and adding to an array, clearing all whitespaces and new lines
//let input = """
//a
//b
//c
//"""
//let letters = input.components(separatedBy: "\n")
//let letter = letters.randomElement()
//let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)

// Checking if spelling is correct using objective C UIKit method, NSNotFound is ObjC version of optional
//let word = "swift"
//let checker = UITextChecker()
//let range = NSRange(location: 0, length: word.utf16.count)
//let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
//let allGood = misspelledRange.location == NSNotFound


