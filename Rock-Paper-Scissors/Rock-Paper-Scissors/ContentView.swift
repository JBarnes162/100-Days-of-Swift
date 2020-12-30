//
//  ContentView.swift
//  Rock-Paper-Scissors
//
//  Created by Jackson Barnes on 29/12/2020.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.blue)
            .background(Color.white)
            .clipShape(Capsule())
            .padding()
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())

    }
}

struct ContentView: View {
    @State private var winLossStatus: Bool = false  // Prompt to be used for determining who wins or who loses
    
    @State private var cpuScore: Int = 0
    @State private var cpuMove = Int.random(in: 0...2)
    @State private var cpuOutcome = Int.random(in: 0...1)
    
    @State private var playerMove: Int = 0          // Choosing which option to pick between possibleMoves array
    @State private var playerOutcome: Int = 0       // Choosing which outcome will occure from possibleOutcome array
    @State private var playerScore: Int = 0
    
    @State private var startTapped: Bool = false
    @State private var resultTitle: String = ""
    @State private var gameOutcome: String = ""
    @State private var showingScore: Bool = false

    
    let possibleMoves = ["Rock", "Paper", "Scissors"]
    let possibleOutcome = ["Win", "Lose"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                VStack{
                    Text("Rock, Paper, Scissors")
                        .font(.title)
                        .titleStyle()
                        .padding()
                    
                    Text("Choose your move:")
                        .titleStyle()
                        .font(.title2)
                    
                    Picker("Player move", selection: $playerMove){
                        ForEach(0 ..< possibleMoves.count) {
                            Text("\(self.possibleMoves[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("Choose the outcome:")
                        .titleStyle()
                        .font(.title2)
                        .foregroundColor(.white)
                    Picker("Outcome", selection: $playerOutcome){
                        ForEach(0 ..< possibleOutcome.count) {
                            Text("\(self.possibleOutcome[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    }
                
                VStack(spacing: 10) {
                    Text("Player Score: \(playerScore)")
                        .titleStyle()
                        .font(.title3)
                    Text("CPU Score: \(cpuScore)")
                        .titleStyle()
                        .font(.title3)
                    }
                
                VStack(spacing: 10) {
                    Button(action: {
                        self.startTapped(playerMove)
                    }, label: {
                        Text("Start")
                            .titleStyle()
                            .font(.title)
                        })
                    }
                }
            }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(resultTitle), message: Text("Player picked: \(possibleMoves[playerMove]) \n CPU Picked: \(possibleMoves[cpuMove]) \n \(gameOutcome)"), dismissButton: .default(Text("Continue")) {
                self.newRound()
            })
        }
    }
    func startTapped (_ number: Int) {
        switch number {
        case 0: // Rock
            if cpuMove == 1 {               // Paper
                resultTitle = "CPU Wins!"
                cpuScore += 1
            } else if cpuMove == 2 {        // Scissors
                resultTitle = "Player Wins!"
                playerScore += 1
            }
        case 1:                             // Paper
            if cpuMove == 0 {               // Rock
                resultTitle = "Player Wins!"
                playerScore += 1
            } else if cpuMove == 2 {        // Scissors
                resultTitle = "CPU Wins!"
                cpuScore += 1
            }
        case 2:                             // Scissors
            if cpuMove == 0 {               // Rock
                resultTitle = "CPU Wins!"
                cpuScore += 1
            } else if cpuMove == 1 {        // Paper
                resultTitle = "Player Wins!"
                playerScore += 1
            }
        default:
            resultTitle = "ERROR"
        }
        
        if resultTitle == "Player Wins!" && playerOutcome == 0 {
            playerScore += 1
            gameOutcome = "Game outcome was guessed correctly!"
        } else {
            playerScore -= 1
            gameOutcome = "Game outcome was guessed incorrectly!"
        }
        
        if resultTitle == "CPU Wins!" && cpuOutcome == 0 {
            cpuScore += 1
            gameOutcome = "Game outcome was guessed correctly!"
        } else {
            cpuScore -= 1
            gameOutcome = "Game outcome was guessed incorrectly!"
        }
        
        if cpuMove == playerMove {
            resultTitle = "It's a draw."
        }
        
        if cpuScore == 10 {
            resultTitle = "CPU WINS!!!"
            gameOutcome = "Game reset"
            cpuScore = 0
            playerScore = 0
        } else if playerScore == 10 {
            resultTitle = "PLAYER WINS!!!"
            gameOutcome = "Game reset"
            cpuScore = 0
            playerScore = 0
        }
        
        showingScore = true
    }
    
    func newRound() {
        cpuMove = Int.random(in: 0...2)
        cpuOutcome = Int.random(in: 0...1)
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
}

