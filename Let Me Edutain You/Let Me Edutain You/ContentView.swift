//
//  ContentView.swift
//  Let Me Edutain You
//
//  Created by Jackson Barnes on 04/01/2021.
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

extension Image {
    func flagImage() -> some View {
        self
            .renderingMode(.original)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(color: .black, radius: 1)
   }
}

struct ContentView: View {
    init(){
            UITableView.appearance().backgroundColor = .clear
        }
    @State private var animalIcons = ["bear", "buffalo", "chick", "chicken",
                                     "cow", "crocodile", "dog", "duck",
                                     "elephant", "frog", "giraffe", "goat",
                                     "gorilla", "hippo", "horse", "monkey",
                                     "moose", "narwhal", "owl", "panda",
                                     "parrot", "penguin", "pig", "rabbit",
                                     "rhino", "sloth", "snake", "walrus",
                                     "whale", "zebra"]
    @State private var animalIcon = 17
    @State private var gameState = false                            // True for Playing - False for Settings
    @State private var multplicationTable = 0                       // Which multiplication table do they want questions for
    @State private var numberOfQuestions = 1                        // How many questions do they want to answer
    @State private var studentName = "Default Name"
    @State private var question = 0

    let questions = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    
    var body: some View {
        NavigationView {
            Group {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue]), startPoint: .topLeading
                                   , endPoint: .trailing).ignoresSafeArea()
                VStack{
                    HStack {
                        VStack {
                        Image(animalIcons[animalIcon])
                            .flagImage()
                            .padding()
                            
                            Text("\(studentName)")
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                    
                        Text("     Let me Edutain You!")
                        .frame(width: 160, height: 75, alignment: .center)
                        .font(.title)
                        .titleStyle()
                    }
                    
                    Form{
                        Section(header: Text("What times table do you want to do?").foregroundColor(.white)){
                            Stepper(value: $multplicationTable, in:
                                        0...11, step: 1) {
                                Text("\(questions[multplicationTable]) times table")
                            }
                        }   .textCase(nil)
                            .font(.title3)
                            .foregroundColor(.black)
               
                            
                      
                        Section(header: Text("How many questions do you want?").foregroundColor(.white)) {
                            Stepper(value: $numberOfQuestions, in:
                                        1...25, step: 1) {
                                Text("\(numberOfQuestions) questions")
                            }
                        }   .textCase(nil)
                            .font(.title3)
                            .foregroundColor(.black)
                        
                    }
                    VStack{
                        NavigationLink(destination: QuestionView(studentName: studentName, timesTable: questions[multplicationTable], questionAmount: numberOfQuestions)) {
                            Text("Start!")
                            .titleStyle()
                            .font(.title)
                        }
                    }.navigationBarTitle("Quit", displayMode: .inline)
                }
            }
        }.navigationBarTitle("Let me Edutain you!")
            .navigationBarHidden(true)
    }
}
    
    
    struct QuestionView: View {
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        @State private var multiplyBy = Int.random(in: 0...11)          // To decide what to multiply the number with
        @State private var playerScore = 0
        @State private var questionNumber = 25
        
        let studentName: String
        let timesTable: Int
        let questionAmount: Int
        
        var correctAnswer: Int {
            let answer = timesTable * multiplyBy
            return answer
        }

            var body: some View {
                Group {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color.blue]), startPoint: .topLeading, endPoint: .trailing).ignoresSafeArea()
                        VStack {
                            VStack{
                                HStack {
                                Text("Q\(questionNumber)")
                                    .frame(width: 75, height: 40, alignment: .center)
                                    .font(.title)
                                    .titleStyle()
                                
                                    
                                Text("What is \(multiplyBy) x \(timesTable)?")
                                    .frame(width: 175, height: 40, alignment: .center)
                                    .font(.title)
                                    .titleStyle()
                            }
                        }
                        .navigationBarTitle("")
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                        
                            Form {
                                VStack {
                                    Text("enter you answer: ")
                                }
                            }
                            VStack(spacing: 10) {
                                Button(action: {
                                    
                                }, label: {
                                    Text("Check Answer")
                                        .titleStyle()
                                        .font(.title)
                                    })
                                }
                        
                    }
                }
            }
        }
    }
}
    
    struct HomeView: View {
            @Binding var buttonClick: Bool

            var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue]), startPoint: .topLeading
                               , endPoint: .trailing).ignoresSafeArea()
                VStack {
                    
                    Button(action: {
                        withAnimation {
                            self.buttonClick.toggle()
                        }
                    }) {
                        Text("Settings")
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
    
    func isCorrect(multipliedBy: Int, timesTable: Int, userAnswer: Int, score: Int) -> Int {
        var answerOutcome = false
        let currentScore = score
        
        if multipliedBy * timesTable == userAnswer {
            answerOutcome = true
        } else {
            answerOutcome = false
    }
        return playerScore(isCorrect: answerOutcome, playerScore: currentScore)
}
    
    func playerScore(isCorrect: Bool, playerScore: Int) -> Int {
        let score = playerScore
        
            if isCorrect {
                return score + 1
            } else {
                return score
            }
    }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

