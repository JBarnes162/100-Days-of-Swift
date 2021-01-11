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
    @State private var playerScore = 0

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
        let studentName: String
        let timesTable: Int
        let questionAmount: Int
        
        @State private var multiplyBy = Int.random(in: 1...12)          // To decide what to multiply the number with
        @State private var playerScore = 0
        @State private var playerAnswer = 1
        @State private var questionCounter = 1
        @State private var showingAlert = false
        
        var correctAnswer: Int {
            let answer = timesTable * multiplyBy
            return answer
        }

            var body: some View {
                NavigationView {
                Group {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color.blue]), startPoint: .topLeading, endPoint: .trailing).ignoresSafeArea()
                        VStack {
                            VStack{
                                HStack {
                                Text("Q\(questionCounter)")
                                    .frame(width: 75, height: 40, alignment: .center)
                                    .font(.title)
                                    .titleStyle()
                                
                                    
                                Text("What is \(multiplyBy) x \(timesTable)?")
                                    .frame(width: 200, height: 40, alignment: .center)
                                    .font(.title)
                                    .titleStyle()
                            }
                        }
                        .navigationBarTitle("")
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                        
                            Form {
                                VStack {
                                    TextField("enter you answer: ", )
                                }
                                VStack {
                                    Text("Your current score is \(questionAmount)")
                                }
                            }
                            VStack(spacing: 10) {
                                Button(action: {
                                    if isCorrect(multipliedBy: multiplyBy, timesTable: timesTable, userAnswer: playerAnswer) {
                                        playerScore += 1
                                    }
                                    
                                    if (questionCounter == questionAmount){
                                        showingAlert = true
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                    questionCounter += 1
                                    multiplyBy = Int.random(in: 1...12)
                                        }) {
                                    Text("Check Answer")
                                        .titleStyle()
                                        .font(.title)
                                        }
                                        .alert(isPresented: $showingAlert) {
                                            Alert(title: Text("You have completed the \(timesTable) times table!"), message: Text("You scored \(playerScore)"), dismissButton: .default(Text("Got it!")))
                                        }
                                }
                        }
                    }
                }
            }.navigationBarHidden(true)
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
    
    func isCorrect(multipliedBy: Int, timesTable: Int, userAnswer: Int) -> Bool {
        
        if multipliedBy * timesTable == userAnswer {
            return true
        } else {
            return false
    }
}
    
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

